##
## Copyright (c) 2018-2024 Stéphane Micheloud
##
## Licensed under the MIT License.
##
##############################################################################

include ../Makefile.inc

SOURCE_DIR  = src
TARGET_DIR  = target

##############################################################################
## main rules

SOURCES  = $(shell $(FIND) "$(SOURCE_DIR)/main/dart" -type f -name "*.dart")
TARGET   = $(TARGET_DIR)/hello-dart.exe

MAIN_CLASS = Main
MAIN_ARGS ?= 

all: build

build: $(TARGET)

$(TARGET): $(SOURCES)
	[ -d "$(TARGET_DIR)" ] || "$(MKDIR)" -p "$(TARGET_DIR)"
	"$(DART)" compile exe $(SOURCES) --output "$(TARGET)"

clean:
	"$(RM)" -rf "$(TARGET_DIR)"

run: build
	$(TARGET)

help:
	@$(ECHO) "Usage: make all|build|clean|help|run"
	@$(ECHO) ""
	@$(ECHO) "   Subcommands:"
	@$(ECHO) "     all    alias for build"
	@$(ECHO) "     build  compile Dart source files"
	@$(ECHO) "     clean  delete generated files"
	@$(ECHO) "     help   print this help message"
	@$(ECHO) "     run    execute main program \"$(TARGET)\""

##############################################################################
## doc rules

TARGET_DOC_DIR = $(TARGET_DIR)/docs
TARGET_DOC     = $(TARGET_DIR)/dart_doc.txt

ifdef DEBUG
DARTDOC_OPTS=--verbose --output "$(abspath $(TARGET_DOC_DIR))" "$(abspath $(SOURCE_DIR))/main/dart"
else
DARTDOC_OPTS=--output "$(abspath $(TARGET_DOC_DIR))" "$(abspath $(SOURCE_DIR))/main/dart"
endif

doc: $(TARGET_DOC)

$(TARGET_DOC):
	[ -d "$(TARGET_DOC_DIR)" ] || "$(MKDIR)" -p "$(TARGET_DOC_DIR)"
	"$(DART)" doc $(DARTDOC_OPTS)
	@$(TOUCH) "$(TARGET_DOC)"

##############################################################################
## lint rules


##############################################################################
## test rules


##############################################################################
## phony

.PHONY: all build clean doc help lint run

.SUFFIXES:
.SUFFIXES: .dart .exe
