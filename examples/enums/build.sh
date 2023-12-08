#!/usr/bin/env bash
#
# Copyright (c) 2018-2023 Stéphane Micheloud
#
# Licensed under the MIT License.
#

##############################################################################
## Subroutines

getHome() {
    local source="${BASH_SOURCE[0]}"
    while [[ -h "$source" ]]; do
        local linked="$(readlink "$source")"
        local dir="$( cd -P $(dirname "$source") && cd -P $(dirname "$linked") && pwd )"
        source="$dir/$(basename "$linked")"
    done
    ( cd -P "$(dirname "$source")" && pwd )
}

debug() {
    local DEBUG_LABEL="[46m[DEBUG][0m"
    $DEBUG && echo "$DEBUG_LABEL $1" 1>&2
}

warning() {
    local WARNING_LABEL="[46m[WARNING][0m"
    echo "$WARNING_LABEL $1" 1>&2
}

error() {
    local ERROR_LABEL="[91mError:[0m"
    echo "$ERROR_LABEL $1" 1>&2
}

# use variables EXITCODE, TIMER_START
cleanup() {
    [[ $1 =~ ^[0-1]$ ]] && EXITCODE=$1

    if $TIMER; then
        local TIMER_END=$(date +'%s')
        local duration=$((TIMER_END - TIMER_START))
        echo "Total execution time: $(date -d @$duration +'%H:%M:%S')" 1>&2
    fi
    debug "EXITCODE=$EXITCODE"
    exit $EXITCODE
}

args() {
    [[ $# -eq 0 ]] && HELP=true && return 1

    for arg in "$@"; do
        case "$arg" in
        ## options
        -debug)    DEBUG=true ;;
        -help)     HELP=true ;;
        -timer)    TIMER=true ;;
        -verbose)  VERBOSE=true ;;
        -*)
            error "Unknown option \"$arg\""
            EXITCODE=1 && return 0
            ;;
        ## subcommands
        clean)     CLEAN=true ;;
        compile)   COMPILE=true ;;
        doc)       DOC=true ;;
        help)      HELP=true ;;
        lint)      LINT=true ;;
        run)       COMPILE=true && RUN=true ;;
        *)
            error "Unknown subcommand \"$arg\""
            EXITCODE=1 && return 0
            ;;
        esac
    done
    debug "Options    : TIMER=$TIMER VERBOSE=$VERBOSE"
    debug "Subcommands: CLEAN=$CLEAN COMPILE=$COMPILE DOC=$DOC HELP=$HELP LINT=$LINT RUN=$RUN"
    debug "Variables  : DART_HOME=$DART_HOME"
    debug "Variables  : GIT_HOME=$GIT_HOME"
    # See http://www.cyberciti.biz/faq/linux-unix-formatting-dates-for-display/
    $TIMER && TIMER_START=$(date +"%s")
}

help() {
    cat << EOS
Usage: $BASENAME { <option> | <subcommand> }

  Options:
    -debug       print commands executed by this script
    -timer       print total execution time
    -verbose     print progress messages

  Subcommands:
    clean        delete generated files
    compile      compile Dart source files
    doc          generate HTML documentation
    help         print this help message
    lint         analyze Dart source files with dart analyze
    run          execute the generated program "${TARGET_FILE/$ROOT_DIR\//}"
EOS
}

clean() {
    if [[ -d "$TARGET_DIR" ]]; then
        if $DEBUG; then
            debug "Delete directory \"$TARGET_DIR\""
        elif $VERBOSE; then
            echo "Delete directory \"${TARGET_DIR/$ROOT_DIR\//}\"" 1>&2
        fi
        rm -rf "$TARGET_DIR"
        [[ $? -eq 0 ]] || ( EXITCODE=1 && return 0 )
    fi
}

lint() {
    local dart_opts=
    $DEBUG && dart_opts="--verbose $dart_opts"

    if $DEBUG; then
        debug "\"$DART_CMD\" analyze \"$(mixed_path $SOURCE_DIR)/main/dart/\" $dart_opts"
    elif $VERBOSE; then
        echo "Analyze Dart source files in directory \"${mixed_path $SOURCE_DIR}\"" 1>&2
    fi
    eval "\"$DART_CMD\" analyze \"$(mixed_path $SOURCE_DIR)/main/dart\" $dart_opts"
    if [[ $? -ne 0 ]]; then
        error "Failed to analyze Dart source files in directory \"${SOURCE_DIR/$ROOT_DIR\//}"
        cleanup 1
    fi
}

compile() {
    [[ -d "$TARGET_DIR" ]] || mkdir -p "$TARGET_DIR"

    local is_required="$(action_required "$TARGET_FILE" "$SOURCE_DIR/main/dart/" "*.dart")"
    [[ $is_required -eq 0 ]] && return 1

    local source_files=
    local n=0
    for f in $(find "$SOURCE_DIR/main/dart/" -type f -name "*.dart" 2>/dev/null); do
        source_files="$source_files\"$f\" "
        n=$((n + 1))
    done
    if [[ $n -eq 0 ]]; then
        warning "No Dart source file found"
        return 1
    fi
    local s=; [[ $n -gt 1 ]] && s="s"
    local n_files="$n Dart source file$s"
    local dart_opts="--output \"$TARGET_FILE\""
    $DEBUG && set dart_opts="--verbose $dart_opts"
    if $DEBUG; then
        debug "$DART_CMD compile exe $source_files $dart_opts"
    elif $VERBOSE; then
        echo "Compile $n_files to directory \"${TARGET_DIR/$ROOT_DIR\//}\"" 1>&2
    fi
    eval "\"$DART_CMD\" compile exe $source_files $dart_opts"
    if [[ $? -ne 0 ]]; then
        error "Failed to compile $n_files to directory \"${TARGET_DIR/$ROOT_DIR\//}\""
        cleanup 1
    fi  
}

action_required() {
    local timestamp_file=$1
    local search_path=$2
    local search_pattern=$3
    local latest=
    for f in $(find $search_path -name $search_pattern 2>/dev/null); do
        [[ $f -nt $latest ]] && latest=$f
    done
    if [[ -z "$latest" ]]; then
        ## Do not compile if no source file
        echo 0
    elif [[ ! -f "$timestamp_file" ]]; then
        ## Do compile if timestamp file doesn't exist
        echo 1
    else
        ## Do compile if timestamp file is older than most recent source file
        local timestamp=$(stat -c %Y $timestamp_file)
        [[ $timestamp_file -nt $latest ]] && echo 1 || echo 0
    fi
}

mixed_path() {
    if [[ -x "$CYGPATH_CMD" ]]; then
        $CYGPATH_CMD -am $1
    elif $mingw || $msys; then
        echo $1 | sed 's|/|\\\\|g'
    else
        echo $1
    fi
}

## See https://github.com/dart-lang/dartdoc#dartdoc_optionsyaml
doc() {
    [[ -d "$TARGET_DOCS_DIR" ]] || mkdir -p "$TARGET_DOCS_DIR"

    local dartdoc_opts="--output=\"$TARGET_DOCS_DIR\""
    $DEBUG && set dartdoc_opts="--verbose $dartdoc_opts"
    if $DEBUG; then
        debug "\"$DART_CMD\" doc $dartdoc_opts \"$SOURCE_MAIN_DIR/\""
    elif $VERBOSE; then
        echo "Generate documentation into directory \"${TARGET_DOCS_DIR/$ROOT_DIR\//}\"" 1>&2
    fi
    eval "\"$DART_CMD\" doc $dartdoc_opts \"$SOURCE_MAIN_DIR/\""
    if [[ $? -ne 0 ]]; then
        error "Failed to generate documentation into directory \"${TARGET_DOCS_DIR/$ROOT_DIR\//}\""
        cleanup 1
    fi
}

run() {
    if [[ ! -f "$TARGET_FILE" ]]; then
        error "Main program \"${MAIN_CLASS/$ROOT_DIR\//}\" not found"
        cleanup 1
    fi
    if $DEBUG; then
        debug "Execute program \"$TARGET_FILE\""
    elif $VERBOSE; then
        echo "Execute program \"${TARGET_FILE/$ROOT_DIR\//}\"" 1>&2
    fi
    eval "$TARGET_FILE"
    if [[ $? -ne 0 ]]; then
        error "Failed to execute program \"${TARGET_FILE/$ROOT_DIR\//}\""
        cleanup 1
    fi
}

run_tests() {
    echo "tests"
}

##############################################################################
## Environment setup

BASENAME=$(basename "${BASH_SOURCE[0]}")

EXITCODE=0

ROOT_DIR="$(getHome)"

SOURCE_DIR=$ROOT_DIR/src
SOURCE_MAIN_DIR=$SOURCE_DIR/main/dart
TARGET_DIR=$ROOT_DIR/target
TARGET_DOCS_DIR=$TARGET_DIR/docs

CLEAN=false
COMPILE=false
DEBUG=false
DOC=false
HELP=false
LINT=false
MAIN_CLASS=hello-dart
MAIN_ARGS=
RUN=false
TEST=false
TIMER=false
VERBOSE=false

COLOR_START="[32m"
COLOR_END="[0m"

cygwin=false
mingw=false
msys=false
darwin=false
case "$(uname -s)" in
    CYGWIN*) cygwin=true ;;
    MINGW*)  mingw=true ;;
    MSYS*)   msys=true ;;
    Darwin*) darwin=true
esac
unset CYGPATH_CMD
PSEP=":"
if $cygwin || $mingw || $msys; then
    CYGPATH_CMD="$(which cygpath 2>/dev/null)"
    PSEP=";"
    [[ -n "$DART_HOME" ]] && DART_HOME="$(mixed_path $DART_HOME)"
    [[ -n "$GIT_HOME" ]] && GIT_HOME="$(mixed_path $GIT_HOME)"
    DIFF_CMD="$GIT_HOME/usr/bin/diff.exe"
    LOCAL_REPO="$(mixed_path $USERPROFILE)/.m2/repository"
else
    DIFF_CMD="$(which diff)"
    LOCAL_REPO="$HOME/.m2/repository"
fi
if [[ ! -x "$DART_HOME/bin/dart" ]]; then
    error "Dart installation not found"
    cleanup 1
fi
DART_CMD="$DART_HOME/bin/dart"

PROJECT_NAME="$(basename $ROOT_DIR)"
PROJECT_URL="github.com/$USER/dart-examples"
PROJECT_VERSION="1.0-SNAPSHOT"

APP_NAME="enums"
APP_VERSION="0.1.0"

TARGET_FILE="$TARGET_DIR/$APP_NAME-$APP_VERSION.exe"

args "$@"
[[ $EXITCODE -eq 0 ]] || cleanup 1

##############################################################################
## Main

$HELP && help && cleanup

if $CLEAN; then
    clean || cleanup 1
fi
if $LINT; then
    lint || cleanup 1
fi
if $COMPILE; then
    compile || cleanup 1
fi
if $DOC; then
    doc || cleanup 1
fi
if $RUN; then
    run || cleanup 1
fi
if $TEST; then
    run_tests || cleanup 1
fi
cleanup
