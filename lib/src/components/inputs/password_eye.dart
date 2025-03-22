import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:meno_design_system/src/components/inputs/meno_input_icon.dart';

/// {@template password_eye}
/// A custom widget for enabling and disabling the [MenoTextfield]
/// `obscureText` flag
/// {@endtemplate}
class PasswordEye extends StatelessWidget {
  /// {@macro password_eye}
  const PasswordEye({
    required this.obscureText,
    required this.onToggle,
    super.key,
    this.size = MenoSize.md,
    this.color,
  });

  /// Boolean flag to hide or display the input value
  final bool obscureText;

  /// [MenoSize] value
  final MenoSize size;

  /// Optional [Color]
  final Color? color;

  /// On toggle password obscurity
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onToggle(!obscureText),
      child: MenoInputIcon(
        obscureText ? MIcons.eye :MIcons.eye_off,
        size: size,
        color: color,
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
