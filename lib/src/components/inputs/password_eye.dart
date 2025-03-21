import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template password_eye}
/// A custom widget for enabling and disabling the [MenoTextfield]
/// `obscureText` flag
/// {@endtemplate}
class PasswordEye extends StatelessWidget {
  /// {@macro password_eye}
  const PasswordEye({
    required this.obscureText,
    super.key,
    this.size = MenoSize.md,
  });

  /// Boolean flag to hide or display the input value
  final bool obscureText;

  /// [MenoSize] value
  final MenoSize size;

  @override
  Widget build(BuildContext context) {
    return MenoInputIcon(
      obscureText
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      size: size,
      alignment: Alignment.centerLeft,
    );
  }
}
