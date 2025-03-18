import 'package:flutter/widgets.dart';
import 'package:meno_design_system/src/core/insets/insets.dart';

/// {@template meno_radius}
///  Class contains all space (does not matter is it vertical
///  or horizontal used in app
/// {@endtemplate}
class MenoRadius {
  MenoRadius._();

  /// Micro radius of 4.0
  static const xxs = Radius.circular(Insets.xxs);

  /// Small radius of 8.0
  static const sm = Radius.circular(Insets.sm);

  /// Medium radius of 12.0
  static const md = Radius.circular(Insets.md);

  /// Large radius of 16.0
  static const lg = Radius.circular(Insets.lg);

  /// Extra Large radius of 20.0
  static const xlg = Radius.circular(Insets.xlg);

  /// Extra extra Large radius of 32.0
  static const xxlg = Radius.circular(Insets.xxlg);

  /// Round Circle
  static const circle = Radius.circular(Insets.circle);
}
