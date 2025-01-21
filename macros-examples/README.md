# <span id="top">Dart 3 macros examples</span> <span style="font-size:90%;">[⬆](../README.md#top)</span>

<table style="font-family:Helvetica;line-height:1.6;">
  <tr>
  <td style="border:0;padding:0 10px 0 0;min-width:100px;">
    <a href="https://dart.dev/" rel="external"><img style="border:0;width:100px;" src="../docs/images/dart-lang.png" width="100" alt="Dart project"/></a>
  </td>
  <td style="border:0;padding:0;vertical-align:text-top;">
    Directory <strong><code>macros-examples\</code></strong> contains <a href="https://dart.dev/" rel="external" title="Dart 3">Dart 3</a> code examples using macros and coming from various websites.
  </td>
  </tr>
</table>

> **&#9755;** The [Dart macro system](https://dart.dev/language/macros) is a major new language feature ***currently under development*** which adds support for static meta-programming to the [Dart] language.

## <span id="bird">`bird` Example</span>

This example has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree" rel="external">tree</a> /f /a . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> /v /b [A-Z]</b>
|   <a href="./bird/00download.txt">00download.txt</a>
|   <a href="./bird/analysis_options.yaml">analysis_options.yaml</a>
|   <a href="./bird/build.bat">build.bat</a>
|   <a href="">build.sh</a>
|   <a href="">Makefile</a>
|   <a href="">pubspec.yaml</a>
\---<b>src</b>
    \---<b>main</b>
        \---<b>dart</b>
                <a href="./bird/src/main/dart/Awesome.dart">Awesome.dart</a>
                <a href="">Bird.dart</a>
                <a href="">main.dart</a>
</pre>

Command [**`build.bat run`**](./bird/build.bat) generates and executes the executable `bird.exe`.

<pre style="font-size:80%;">
<b>&gt; <a href="./bird/build.bat">build</a> -verbose run</b>
Resolve project dependencies
Resolving dependencies...
Downloading packages...
+ _macros 0.3.2 from sdk dart
+ macros 0.1.2-main.4 (0.1.3-main.0 available)
Changed 2 dependencies!
1 package has newer versions incompatible with dependency constraints.
Try `dart pub outdated` for more information.
Compile 1 Dart source file into directory "target"
Execute program "target\bird.exe"
Macros are awesome
Bird
</pre>


In the same way command [**`make.exe`**][make_cli] executes the build commands `clean` and `run` defined in project file [`Makefile`](./userJson/Makefile) (use option `-q` to hide progress messages) :

<pre style="font-size:80%;">
<b>&gt; <a href="https://man7.org/linux/man-pages/man1/make.1.html" rel="external">make</a> clean run</b>
"/usr/bin/rm.exe" -rf "target"
[ -d "target" ] || "/usr/bin/mkdir.exe" -p "target"
"C:/opt/dart-sdk/bin/dart.exe" pub upgrade
Resolving dependencies...
Downloading packages...
  macros 0.1.2-main.4 (0.1.3-main.0 available)
No dependencies changed.
1 package has newer versions incompatible with dependency constraints.
Try `dart pub outdated` for more information.
"C:/opt/dart-sdk/bin/dart.exe" compile exe --enable-experiment=macros --output "F:\macros-examples\bird\target\bird.exe" "F:\macros-examples\bird\src\main\dart\main.dart"
Generated: f:\macros-examples\bird\target\bird.exe
target/bird.exe
Macros are awesome
Bird
</pre>

Finally, the bash script [**`build.sh`**](./bird/build.sh) works in the same way as batch file [**`build.bat`**](./bird/build.bat) :

<pre style="font-size:80%;">
<b>&gt; <a href="https://man7.org/linux/man-pages/man1/sh.1p.html" rel="external">sh</a> <a href="./bird/build.sh">build.sh</a> clean run</b>
Resolving dependencies...
Downloading packages...
+ _macros 0.3.2 from sdk dart
+ macros 0.1.2-main.4 (0.1.3-main.0 available)
Changed 2 dependencies!
1 package has newer versions incompatible with dependency constraints.
Try `dart pub outdated` for more information.
Generated: f:\macros-examples\bird\target\bird.exe
Macros are awesome
Bird
</pre>

## <span id="user_json">`userJson` Example</span>

This example has the following directory structure :

<pre style="font-size:80%;">
<b>&gt; <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree" rel="external">tree</a> /f /a . | <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/findstr" rel="external">findstr</a> /v /b [A-Z]</b>
|   <a href="./userJson/00download.txt">00download.txt</a>
|   <a href="./userJson/analysis_options.yaml">analysis_options.yaml</a>
|   <a href="./userJson/build.bat">build.bat</a>
|   <a href="./userJson/build.sh">build.sh</a>
|   <a href="./userJson/pubspec.yaml">pubspec.yaml</a>
\---<b>src</b>
    \---<b>main</b>
        \---<b>dart</b>
                <a href="./userJson/src/main/dart/main.dart">main.dart</a>
                <a href="./userJson/src/main/dart/User.dart">User.dart</a>
</pre>

Command [**`build.bat run`**](./userJson/build.bat) generates the executable `userJson.exe` from source file [`main.dart`](./userJson/src/main/dart/main.dart) and runs it.

<pre style="font-size:80%;">
<b>&gt; <a href="./userJson/build.bat">build</a> -verbose run</b>
Resolve project dependencies
Resolving dependencies...
Downloading packages...
+ _macros 0.3.2 from sdk dart
+ json 0.20.2 (0.20.4 available)
+ macros 0.1.2-main.4 (0.1.3-main.0 available)
Changed 3 dependencies!
2 packages have newer versions incompatible with dependency constraints.
Try `dart pub outdated` for more information.
Compile 1 Dart source file into directory "target"
Execute program "target\userJson.exe"
Instance of 'User'
{age: 5, name: Roger, username: roger1337}
</pre>

In the same way command [**`make.exe`**][make_cli] executes the build commands `clean` and `run` defined in project file [`Makefile`](./userJson/Makefile) (use option `-q` to hide progress messages) :

<pre style="font-size:80%;">
<b>&gt; <a href="https://man7.org/linux/man-pages/man1/make.1.html" rel="external">make</a> clean run</b>
"/usr/bin/rm.exe" -rf "target"
[ -d "target" ] || "/usr/bin/mkdir.exe" -p "target"
"C:/opt/dart-sdk/bin/dart.exe" pub upgrade
Resolving dependencies...
Downloading packages...
  json 0.20.2 (0.20.4 available)
  macros 0.1.2-main.4 (0.1.3-main.0 available)
No dependencies changed.
2 packages have newer versions incompatible with dependency constraints.
Try `dart pub outdated` for more information.
"C:/opt/dart-sdk/bin/dart.exe" compile exe --enable-experiment=macros --output "F:\macros-examples\userJson\target\userJson.exe" "F:\macros-examples\userJson\src\main\dart\main.dart"
Generated: f:\macros-examples\userjson\target\userjson.exe
target/userJson.exe
Instance of 'User'
{age: 5, name: Roger, username: roger1337}
</pre>

Finally, the bash script [**`build.sh`**](./userJson/build.sh) works in the same way as batch file [**`build.bat`**](./userJson/build.bat) :

<pre style="font-size:80%;">
<b>&gt; <a href="https://man7.org/linux/man-pages/man1/sh.1p.html" rel="external">sh</a> <a href="./userJson/build.sh">build.sh</a> clean run</b>
Resolving dependencies...
Downloading packages...
  json 0.20.2 (0.20.4 available)
  macros 0.1.2-main.4 (0.1.3-main.0 available)
No dependencies changed.
2 packages have newer versions incompatible with dependency constraints.
Try `dart pub outdated` for more information.
Generated: f:\macros-examples\userjson\target\userjson.exe
Instance of 'User'
{age: 5, name: Roger, username: roger1337}
</pre>

***

*[mics](https://lampwww.epfl.ch/~michelou/)/January 2025* [**&#9650;**](#top)
<span id="bottom">&nbsp;</span>

<!-- link refs -->

[dart]: https://dart.dev
[make_cli]: https://man7.org/linux/man-pages/man1/make.1.html
