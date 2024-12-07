import 'dart:async';

import 'package:macros/macros.dart';

final _dartCore = Uri.parse('dart:core');

macro class Awesome implements ClassDeclarationsMacro {
  const Awesome();

  @override
  Future<void> buildDeclarationsForClass(
    ClassDeclaration clazz,
    MemberDeclarationBuilder builder,
  ) async {
    final annOverride = await builder.resolveIdentifier(_dartCore, 'override');
    final print = await builder.resolveIdentifier(_dartCore, 'print');
    final typString = await builder.resolveIdentifier(_dartCore, 'String');
    builder.declareInType(
      DeclarationCode.fromParts([
        '@', annOverride, ' ', typString, ' toString() {\n',
        print, '("Macros are awesome");\n',
        'return "', clazz.identifier.name, '";\n',
        '}',
      ]),
    );
  }

}  // class Awesome
