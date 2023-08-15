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

## <span id="enums">`enums` Example</span>

Command [`build.bat`](./enums/build.bat) generates the executable `enums.exe` from source file [`main.dart`](./enums/src/main/dart/main.dart) and execute it.

<pre style="font-size:80%;">
<b>&gt; <a href="./enums/build.bat">build</a> -verbose run</b>
Compile 1 Dart source file into directory "target"
Execute program "target\enums.exe"
The venus planet is not a "giant planet".
blue
Color.blue
A car is a vehicle with 4 tires.
80
</pre>

In the same way command [make] executes the build commands `clean` and `run` defined in project file [`Makefile`](./enums/Makefile) (use option `-q` to hide progress messages) :

<pre style="font-size:80%;">
<b>&gt; <a href="https://man7.org/linux/man-pages/man1/make.1.html" rel="external">make</a> clean run</b>
"C:/opt/Git-2.41.0/usr/bin/rm.exe" -rf "target"
[ -d "target" ] || "C:/opt/Git-2.41.0/usr/bin/mkdir.exe" -p "target"
"C:/opt/dart-sdk-3.0.7/bin/dart.exe" compile exe src/main/dart/main.dart --output "target/hello-dart.exe"
Info: Compiling with sound null safety.
Generated: r:\examples\enums\target\hello-dart.exe
target/hello-dart.exe
The venus planet is not a "giant planet".
blue
Color.blue
A car is a vehicle with 4 tires.
80
</pre>

Finally, the bash script [`build.sh`](./enums/build.sh) works in the same way as batch file [`build.bat`](./enums/build.bat) :

<pre style="font-size:80%;">
<b>&gt; <a href="https://man7.org/linux/man-pages/man1/sh.1p.html" rel="external">sh</a> <a href="./enums/build.sh">build.sh</a> clean run</b>
Info: Compiling with sound null safety.
Generated: f:\examples\enums\target\hello-dart-0.1.0.exe
The venus planet is not a "giant planet".
blue
Color.blue
A car is a vehicle with 4 tires.
80
</pre>

## <span id="hello_dart">`hello-dart` Example</span> [**&#x25B4;**](#top)

Command [`build.bat`](./hello-dart/build.bat) generates the executable `hello-dart.exe` from source file [`main.dart`](./hello-dart/src/main/dart/main.dart) and execute it.

<pre style="font-size:80%;">
<b>&gt; <a href="hello-dart/build.bat">build</a> -verbose clean run</b>
Delete directory "target"
Compile 1 Dart source file into directory "target"
Execute program "target\hello-dart.exe"
Hello, World!
</pre>

Executing command [`build.bat`](./hello-dart/build.bat) with option `-debug` instead of `-verbose` produces the following output :

<pre style="font-size:80%;">
<b>&gt; <a href="./hello-dart/build.bat">build</a> -debug clean run</b>
[build] Options    : _TARGET= _TIMER=0 _VERBOSE=0
[build] Subcommands: _CLEAN=1 _COMPILE=1 _RUN=1
[build] Variables  : "DART_HOME=C:\opt\dart-sdk-3.0.7"
[build] Variables  : "GIT_HOME=C:\opt\Git-2.41.0"
[build] rmdir /s /q "T:\examples\hello-dart\target"
[build] "C:\opt\dart-sdk-3.0.7\bin\dart.exe" compile exe  "T:\examples\hello-dart\src\main\dart\main.dart" --verbose --output "T:\examples\hello-dart\target\hello-dart.exe"
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

In the same way command [make] executes the build commands `clean` and `run` defined in project file [`Makefile`](./hello-dart/Makefile) :

<pre style="font-size:80%;">
<b>&gt; <a href="https://man7.org/linux/man-pages/man1/make.1.html" rel="external">make</a> clean run</b>
"C:/opt/Git-2.41.0/usr/bin/rm.exe" -rf "target"
[ -d "target" ] || "C:/opt/Git-2.41.0/usr/bin/mkdir.exe" -p "target"
"C:/opt/dart-sdk-3.0.7/bin/dart.exe" compile exe src/main/dart/main.dart --output "target/hello-dart.exe"
Info: Compiling with sound null safety.
Generated: r:\examples\hello-dart\target\hello-dart.exe
target/hello-dart.exe
Hello, World!¨
</pre>

Finally, the bash script [`build.sh`](./hello-dart/build.sh) works in the same way as batch file [`build.bat`](./hello-dart/build.bat) :

<pre style="font-size:80%;">
<b>&gt; <a href="https://man7.org/linux/man-pages/man1/sh.1p.html" rel="external">sh</a> <a href="./hello-dart/build.sh">build.sh</a> clean run</b>
Info: Compiling with sound null safety.
Generated: f:\examples\hello-dart\target\hello-dart-0.1.0.exe
Hello, World!
</pre>

## <span id="records">`records` Example</span> [**&#x25B4;**](#top)

Command [`build.bat`](./records/build.bat) generates the executable `records.exe` from source file [`main.dart`](./records/src/main/dart/main.dart) and execute it.

<pre style="font-size:80%;">
<b>&gt; <a href="./records/build.bat">build</a> -verbose clean run</b>
Delete directory "target"
Compile 1 Dart source file into directory "target"
Execute program "target\records.exe"
x=(23, 0, 77.0, age: 20, name: Doe)
x.$2=0
x.name=Doe
Hello John! Your ticket is: 0

($lat, $lon)=(10.0, 20.0)
(-1.0, 7.0)
</pre>

In the same way command [make] executes the build commands `clean` and `run` defined in project file [`Makefile`](./records/Makefile) :

<pre style="font-size:80%;">
<b>&gt; <a href="https://man7.org/linux/man-pages/man1/make.1.html" rel="external">make</a> clean run</b>
"C:/opt/Git-2.41.0/usr/bin/rm.exe" -rf "target"
[ -d "target" ] || "C:/opt/Git-2.41.0/usr/bin/mkdir.exe" -p "target"
"C:/opt/dart-sdk-3.0.7/bin/dart.exe" compile exe src/main/dart/main.dart --output "target/records.exe"
Info: Compiling with sound null safety.
Generated: f:\examples\records\target\records.exe
target/records.exe
x=(23, 0, 77.0, age: 20, name: Doe)
x.$2=0
x.name=Doe
Hello John! Your ticket is: 36

($lat, $lon)=(10.0, 20.0)
(-1.0, 7.0)
</pre>

Finally, the bash script [`build.sh`](./records/build.sh) works in the same way as batch file [`build.bat`](./records/build.bat) :

<pre style="font-size:80%;">
<b>&gt; <a href="https://man7.org/linux/man-pages/man1/sh.1p.html" rel="external">sh</a> <a href="./records/build.sh">build.sh</a> clean run</b>
Info: Compiling with sound null safety.
Generated: f:\examples\records\target\hello-dart-0.1.0.exe
x=(23, 0, 77.0, age: 20, name: Doe)
x.$2=0
x.name=Doe
Hello John! Your ticket is: 51

($lat, $lon)=(10.0, 20.0)
(-1.0, 7.0)
</pre>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/August 2023* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[make]: https://man7.org/linux/man-pages/man1/make.1.html
