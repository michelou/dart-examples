# <span id="top">Playing with Dart 3 on Windows</span>

<table style="font-family:Helvetica,Arial;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:60px;max-width:100px;">
    <a href="https://dart.dev/" rel="external"><img style="border:0;" src="docs/images/dart-lang.png" alt="Dart project"/></a>
  </td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    This repository gathers <a href="https://dart.dev/" rel="external">Dart 3</a> code examples coming from various websites - mostly from the <a href="https://dart.dev" rel="external">Dart</a> project - or written by ourself.<br/>
    In particular it includes several build scripts (<a href="https://www.gnu.org/software/bash/manual/bash.html" rel="external">Bash scripts</a>, <a href="https://en.wikibooks.org/wiki/Windows_Batch_Scripting" rel="external">batch files</a>, <a href="https://makefiletutorial.com/" rel="external">Make scripts</a>) for experimenting with the <a href="https://dart.dev/guides/language/spec" rel="external">Dart 3</a> language on a Windows machine.
  </td>
  </tr>
</table>

[Ada][ada_examples], [Akka][akka_examples], [C++][cpp_examples], [COBOL][cobol_examples], [Dafny][dafny_examples], [Deno][deno_examples], [Docker][docker_examples], [Erlang][erlang_examples], [Flix][flix_examples], [Go][golang_examples], [GraalVM][graalvm_examples], [Haskell][haskell_examples], [Kafka][kafka_examples], [Kotlin][kotlin_examples], [LLVM][llvm_examples], [Modula-2][m2_examples], [Node.js][nodejs_examples], [Rust][rust_examples], [Scala 3][scala3_examples], [Spark][spark_examples], [Spring][spring_examples], [Standard ML][sml_examples], [TruffleSqueak][trufflesqueak_examples], [WiX Toolset][wix_examples] and [Zig][zig_examples] are other topics we are continuously monitoring.

> **&#9755;** Dart 3 contains three major advancements. Read the document ["Announcing Dart 3"](https://medium.com/dartlang/announcing-dart-3-53f065a10635) for more details. Furthermore the document ["Dart language evolution"](https://dart.dev/guides/language/evolution) describes changes and additions to the Dart language.

## <span id="proj_deps">Project dependencies</span>

This project depends on the following external software for the **Microsoft Windows** platform:

- [Dart 3.7][dart_releases] ([*changelog*][dart_changelog]) ([*issue tracker*][dart_issue_tracker])
- [Git 2.49][git_releases] ([*release notes*][git_relnotes])

Optionally one may also install the following software:

- [ConEmu 2023][conemu_downloads] ([*release notes*][conemu_relnotes])
- [Visual Studio Code 1.98][vscode_downloads] ([*release notes*][vscode_relnotes])

> **&#9755;** ***Installation policy***<br/>
> When possible we install software from a [Zip archive][zip_archive] rather than via a [Windows installer][windows_installer]. In our case we defined **`C:\opt\`** as the installation directory for optional software tools (*in reference to* the [**`/opt/`**][unix_opt] directory on Unix).

For instance our development environment looks as follows (*March 2025*) <sup id="anchor_01">[1](#footnote_01)</sup>:

<pre style="font-size:80%;">
C:\opt\ConEmu\      <i>( 26 MB)</i>
C:\opt\dart-sdk\    <i>(542 MB)</i>
C:\opt\Git\         <i>(393 MB)</i>
C:\opt\VSCode\      <i>(381 MB)</i>
</pre>

> **:mag_right:** [Git for Windows][git_releases] provides a Bash emulation used to run [**`git.exe`**][git_cli] from the command line (as well as over 250 Unix commands like [**`awk`**][man1_awk], [**`diff`**][man1_diff], [**`file`**][man1_file], [**`grep`**][man1_grep], [**`more`**][man1_more], [**`mv`**][man1_mv], [**`rmdir`**][man1_rmdir], [**`sed`**][man1_sed] and [**`wc`**][man1_wc]).

## <span id="structure">Directory structure</span> [**&#x25B4;**](#top)

This project has the following directory structure :

<pre style="font-size:80%;">
bin\
dartbyexample\{<a href="dartbyexample/README.md">README.md</a>, <a href="dartbyexample/exceptions/">exceptions</a>, ..}
docs\
examples\{<a href="examples/README.md">README.md</a>, <a href="examples/hello-dart/">hello-dart</a>, ..}
macros-examples\{<a href="macros-examples/README.md">README.md</a>, <a href="macros-examples/bird/">bird</a>, <a href="macros-examples/userJson/">userJson</a>, ..}
README.md
<a href="RESOURCES.md">RESOURCES.md</a>
<a href="setenv.bat">setenv.bat</a>
</pre>

where

- directory [**`bin\`**](bin/) contains several batch files.
- directory [**`docs\`**](docs/) contains several [Dart] related papers/articles ([**`docs\README.md`**](docs/README.md)).
- directory [**`examples\`**](examples/) contains [Dart] examples grabbed from various websites ([**`examples\README.md`**](examples/README.md)).
- directory [**`macros-examples\`**](macros-examples/) contains [Dart] examples using macros and grabbed from various websites ([**`macros-examples\README.md`**](macros-examples/README.md)).
- file [**`README.md`**](README.md) is the [Markdown][github_markdown] document for this page.
- file [**`RESOURCES.md`**](RESOURCES.md) is the [Markdown][github_markdown] document presenting external resources.
- file [**`setenv.bat`**](setenv.bat) is the batch command for setting up our environment.

We also define a virtual drive &ndash; e.g. drive **`T:`** &ndash; in our working environment in order to reduce/hide the real path of our project directory (see article ["Windows command prompt limitation"][windows_limitation] from Microsoft Support).
> **:mag_right:** We use the Windows external command [**`subst`**][windows_subst] to create virtual drives; for instance:
>
> <pre style="font-size:80%;">
> <b>&gt; <a href="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/subst">subst</a> T: <a href="https://en.wikipedia.org/wiki/Environment_variable#Default_values">%USERPROFILE%</a>\workspace\dart-examples</b>
> </pre>

In the next section we give a brief description of the batch files present in this project.

## <span id="commands">Batch/Bash commands</span>

### **`setenv.bat`** <sup id="anchor_02">[2](#footnote_02)</sup>

We execute command [**`setenv.bat`**](setenv.bat) once to setup our development environment; it makes external tools such as [**`git.exe`**][git_cli], [**`make.exe`**][make_cli] and [**`sh.exe`**][sh_cli] directly available from the command prompt.

   <pre style="font-size:80%;">
   <b>&gt; <a href="./setenv.bat">setenv</a></b>
   Tool versions:
      dart 3.7.2, make 4.4.1, code 1.98.2,
      git 2.49.0, diff 3.11, bash 5.2.37(1)
   &nbsp;
   <b>&gt; <a href="">where</a> git make sh</b>
   C:\opt\Git\bin\git.exe
   C:\opt\Git\mingw64\bin\git.exe
   C:\opt\msys64\usr\bin\make.exe
   C:\opt\Git\bin\sh.exe
   C:\opt\Git\usr\bin\sh.exe
   </pre>

Command [**`setenv -verbose`**](./setenv.bat) also displays the tool paths, the environment variables and the path associations (use subcommand `help`to print the help messsage) :

<pre style="font-size:80%;">
<b>&gt; <a href="./setenv.bat">setenv -verbose</a></b>
Select drive I: for which a substitution already exists
Tool versions:
   dart 3.7.2, make 4.4.1, code 1.98.2,
   git 2.49.0, diff 3.11, bash 5.2.37(1)
Tool paths:
   C:\opt\dart-sdk\bin\dart.exe
   C:\opt\msys64\usr\bin\make.exe
   C:\opt\Git\bin\git.exe
   C:\opt\Git\usr\bin\diff.exe
   C:\opt\Git\bin\bash.exe
Environment variables:
   "DART_HOME=C:\opt\dart-sdk"
   "GIT_HOME=C:\opt\Git"
   "MSYS_HOME=C:\opt\msys64"
   "VSCODE_HOME=C:\opt\VSCode"
Path associations:
   I:\: => %USERPROFILE%\workspace-perso\dart-examples
</pre>

## <span id="footnotes">Footnotes</span> [**&#x25B4;**](#top)

<span id="footnote_01">[1]</span> ***Downloads*** [↩](#anchor_01)

<dl><dd>
In our case we downloaded the following installation files (<a href="#proj_deps">see section 1</a>):
</p>
<pre style="font-size:80%;">
<a href="https://github.com/Maximus5/ConEmu/releases/tag/v23.07.24" rel="external">ConEmuPack.230724.7z</a>              <i>(  5 MB)</i>
<a href="https://dart.dev/tools/sdk/archive#stable-channel">dartsdk-windows-x64-release.zip</a>   <i>(206 MB)</i>
<a href="https://git-scm.com/download/win">PortableGit-2.49.0-64-bit.7z.exe</a>  <i>( 41 MB)</i>
<a href="https://code.visualstudio.com/Download#" rel="external">VSCode-win32-x64-1.98.2.zip</a>       <i>(131 MB)</i>
</pre>
</dd></dl>

<span id="footnote_02">[2]</span> **`setenv.bat` *usage*** [↩](#anchor_02)

<dl><dd>
Batch file <a href=./setenv.bat><code><b>setenv.bat</b></code></a> has specific environment variables set that enable us to use command-line developer tools more easily.
</dd>
<dd>It is similar to the setup scripts described on the page <a href="https://learn.microsoft.com/en-us/visualstudio/ide/reference/command-prompt-powershell" rel="external">"Visual Studio Developer Command Prompt and Developer PowerShell"</a> of the <a href="https://learn.microsoft.com/en-us/visualstudio/windows" rel="external">Visual Studio</a> online documentation.
</dd>
<dd>
For instance we can quickly check that the two scripts <code><b>Launch-VsDevShell.ps1</b></code> and <code><b>VsDevCmd.bat</b></code> are indeed available in our Visual Studio 2019 installation :
<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/where" rel="external">where</a> /r "C:\Program Files (x86)\Microsoft Visual Studio" *vsdev*</b>
C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\Launch-VsDevShell.ps1
C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\VsDevCmd.bat
C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\vsdevcmd\core\vsdevcmd_end.bat
C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\vsdevcmd\core\vsdevcmd_start.bat
</pre>
</dd>
<dd>
Concretely, in our GitHub projects which depend on Visual Studio (e.g. <a href="https://github.com/michelou/cpp-examples"><code>michelou/cpp-examples</code></a>), <a href="./setenv.bat"><code><b>setenv.bat</b></code></a> does invoke <code><b>VsDevCmd.bat</b></code> (resp. <code><b>vcvarall.bat</b></code> for older Visual Studio versions) to setup the Visual Studio tools on the command prompt. 
</dd></dl>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/March 2025* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[ada_examples]: https://github.com/michelou/ada-examples#top
[akka_examples]: https://github.com/michelou/akka-examples#top
[cobol_examples]: https://github.com/michelou/cobol-examples#top
[conemu_downloads]: https://github.com/Maximus5/ConEmu/releases
[conemu_relnotes]: https://conemu.github.io/blog/2023/07/24/Build-230724.html
[cpp_examples]: https://github.com/michelou/cpp-examples#top
[dart]: https://dart.dev/
[dart_changelog]: https://github.com/dart-lang/sdk/blob/master/CHANGELOG.md
[dart_issue_tracker]: https://github.com/dart-lang/sdk/issues
[dart_releases]: https://dart.dev/get-dart/archive#stable-channel
[dafny_examples]: https://github.com/michelou/dafny-examples#top
[deno_examples]: https://github.com/michelou/deno-examples#top
[docker_examples]: https://github.com/michelou/docker-examples#top
[erlang_examples]: https://github.com/michelou/erlang-examples#top
[flix_examples]: https://github.com/michelou/flix-examples#top
[git_cli]: https://git-scm.com/docs/git
[git_releases]: https://git-scm.com/download/win
[git_relnotes]: https://github.com/git/git/blob/v2.49.0/Documentation/RelNotes/2.49.0.txt
[github_markdown]: https://github.github.com/gfm/
[golang_examples]: https://github.com/michelou/golang-examples#top
[graalvm_examples]: https://github.com/michelou/graalvm-examples#top
[haskell_examples]: https://github.com/michelou/haskell-examples#top
[jmh]: https://openjdk.java.net/projects/code-tools/jmh/
[kafka_examples]: https://github.com/michelou/kafka-examples#top
[kotlin_examples]: https://github.com/michelou/kotlin-examples#top
[llvm_examples]: https://github.com/michelou/llvm-examples#top
[m2_examples]: https://github.com/michelou/m2-examples#top
[make_cli]: https://www.gnu.org/software/make/manual/html_node/Running.html
[man1_awk]: https://www.linux.org/docs/man1/awk.html
[man1_diff]: https://www.linux.org/docs/man1/diff.html
[man1_file]: https://www.linux.org/docs/man1/file.html
[man1_grep]: https://www.linux.org/docs/man1/grep.html
[man1_more]: https://www.linux.org/docs/man1/more.html
[man1_mv]: https://www.linux.org/docs/man1/mv.html
[man1_rmdir]: https://www.linux.org/docs/man1/rmdir.html
[man1_sed]: https://www.linux.org/docs/man1/sed.html
[man1_wc]: https://www.linux.org/docs/man1/wc.html
[nodejs_examples]: https://github.com/michelou/nodejs-examples#top
[rust_examples]: https://github.com/michelou/rust-examples#top
[scala3_examples]: https://github.com/michelou/dotty-examples#top
[scala3_metaprogramming]: https://dotty.epfl.ch/docs/reference/metaprogramming/toc.html
[sh_cli]: https://man7.org/linux/man-pages/man1/sh.1p.html
[sml_examples]: https://github.com/michelou/sml-examples#top
[spark_examples]: https://github.com/michelou/spark-examples#top
[spring_examples]: https://github.com/michelou/spring-examples#top
[trufflesqueak_examples]: https://github.com/michelou/trufflesqueak-examples#top
[unix_opt]: https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/opt.html
[vscode_downloads]: https://code.visualstudio.com/#alt-downloads
[vscode_relnotes]: https://code.visualstudio.com/updates/
[windows_batch_file]: https://en.wikibooks.org/wiki/Windows_Batch_Scripting
[windows_installer]: https://docs.microsoft.com/en-us/windows/win32/msi/windows-installer-portal
[windows_limitation]: https://support.microsoft.com/en-gb/help/830473/command-prompt-cmd-exe-command-line-string-limitation
[windows_subst]: https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/subst
[wix_examples]: https://github.com/michelou/wix-examples#top
[zig_examples]: https://github.com/michelou/zig-examples#top
[zip_archive]: https://www.howtogeek.com/178146/htg-explains-everything-you-need-to-know-about-zipped-files/
