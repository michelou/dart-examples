# <span id="top">Dart 3 examples</span> <span style="size:30%;"><a href="../README.md">⬆</a></span>

<table style="font-family:Helvetica;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:100px;">
    <a href="https://dart.dev/" rel="external"><img style="border:0;width:100px;" src="../docs/images/dart-lang.png" width="100" alt="Dart project"/></a>
  </td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    Directory <strong><code>examples\</code></strong> contains <a href="https://dart.dev/" rel="external" title="Dart 3">Dart 3</a> code examples coming from various websites.
  </td>
  </tr>
</table>

## <span id="hello_dart">`hello-dart` Example</span>

Command [`build.bat`](./hello-dart/build.bat) generates the executable `hello-dart.exe` from source file [`main.dart`](./hello-dart/src/main/dart/main.dart) and execute it.

<pre style="font-size:80%;">
<b>&gt; <a href="hello-dart/build.bat">build</a> -verbose clean run</b>
Delete directory "target"
Compile 1 Dart source file into directory "target"
Execute program "target\hello-dart.exe"
Hello, World!
</pre>

Running command [`build.bat`](./hello-dart/build.bat) with option `-debug` instead of `-verbose` produces the following output :

<pre style="font-size:80%;">
<b>&gt; <a href="./hello-dart/build.bat">build</a> -debug clean run</b>
[build] Options    : _TARGET= _TIMER=0 _VERBOSE=0
[build] Subcommands: _CLEAN=1 _COMPILE=1 _RUN=1
[build] Variables  : "DART_HOME=C:\opt\dart-sdk-3.0.0"
[build] rmdir /s /q "T:\examples\hello-dart\target"
[build] "C:\opt\dart-sdk-3.0.0\bin\dart.exe" compile exe  "T:\examples\hello-dart\src\main\dart\main.dart" --verbose --output "T:\examples\hello-dart\target\hello-dart.exe"
Compiling T:\examples\hello-dart\src\main\dart\main.dart to T:\examples\hello-dart\target\hello-dart.exe using format exe:
Generating AOT kernel dill.
Info: Compiling with sound null safety
Generating AOT snapshot.
Generating executable.
Generated: T:\examples\hello-dart\target\hello-dart.exe
[build] Execute program "target\hello-dart.exe"
Hello, World!
[build] _EXITCODE=0
</pre>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/April 2023* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->
