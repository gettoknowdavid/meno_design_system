import 'package:flutter/widgets.dart';

/// {@template meno_shadow}
/// Shadow class contains all shadows used in app
/// {@endtemplate}
class MenoShadow {
  MenoShadow._();

  /// Small shadow.
  static const sm = [
    BoxShadow(
      offset: Offset(0, 2),
      blurRadius: 10,
      spreadRadius: 2,
      color: Color.fromRGBO(0, 0, 0, 0.05),
    ),
  ];

  /// Medium shadow.
  static const md = [
    BoxShadow(
      offset: Offset(0, 6),
      blurRadius: 10,
      spreadRadius: 4,
      color: Color.fromRGBO(0, 0, 0, 0.08),
    ),
  ];

  /// Large shadow.
  static const lg = [
    BoxShadow(
      offset: Offset(0, 8),
      blurRadius: 10,
      spreadRadius: 2,
      color: Color.fromRGBO(0, 0, 0, 0.08),
    ),
    BoxShadow(
      offset: Offset(0, -1),
      blurRadius: 12,
      color: Color.fromRGBO(0, 0, 0, 0.08),
    ),
  ];
}
