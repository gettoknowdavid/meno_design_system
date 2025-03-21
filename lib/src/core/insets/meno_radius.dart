import 'package:flutter/widgets.dart';
import 'package:meno_design_system/src/core/insets/insets.dart';

/// {@template meno_radius}
///  Class contains all space (does not matter is it vertical
///  or horizontal used in app
/// {@endtemplate}
class MenoRadius {
  MenoRadius._();

  /// Micro radius of 4.0
  static const xs = Radius.circular(Insets.xs);

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

/// {@template meno_border_radius}
///  Class contains all space (does not matter is it vertical
///  or horizontal used in app
/// {@endtemplate}
class MenoBorderRadius {
  MenoBorderRadius._();

  /// Micro border radius of 4.0
  static const xs = BorderRadius.all(MenoRadius.xs);

  /// Small border radius of 8.0
  static const sm = BorderRadius.all(MenoRadius.sm);

  /// Medium border radius of 12.0
  static const md = BorderRadius.all(MenoRadius.md);

  /// Large border radius of 16.0
  static const lg = BorderRadius.all(MenoRadius.lg);

  /// Extra Large border radius of 20.0
  static const xlg = BorderRadius.all(MenoRadius.xlg);

  /// Extra extra Large border radius of 32.0
  static const xxlg = BorderRadius.all(MenoRadius.xxlg);

  /// Round border radius
  static const circle = BorderRadius.all(MenoRadius.circle);
}
