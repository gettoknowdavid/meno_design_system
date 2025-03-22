import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:pinput/pinput.dart';

/// A customizable OTP (One-Time Password) input field.
///
/// This widget creates a field for entering OTP codes, which is typically used
/// for authentication and verification processes. It supports features such as
/// a specific length for the OTP, obscure text for privacy, and custom
/// validation.
///
/// To use this widget, configure the parameters according to your requirements.
/// For example:
/// ```dart
/// MenoOtpField(
///   length: 6,
///   onChanged: (value) {
///     // Handle OTP changes
///   },
///   validator: (value) {
///     // Validate OTP input
///     if (value == null || value.length < 6) {
///       return 'Enter a valid OTP';
///     }
///     return null;
///   },
/// );
/// ```
class MenoOtpField extends StatelessWidget {
  /// Creates an instance of [MenoOtpField].
  ///
  /// Parameters:
  /// - [key]: An optional key to identify the widget.
  /// - [controller]: An optional controller for managing the text input.
  /// - [enabled]: A boolean to control whether the field is enabled.
  /// Defaults to true.
  /// - [focusNode]: An optional focus node for managing focus.
  /// - [length]: The number of OTP fields to display. Defaults to 4.
  /// - [obscureText]: A boolean to control whether the text should be
  /// obscured. Defaults to false.
  /// - [onChanged]: A callback function that is called when the text changes.
  /// - [validator]: An optional function for validating the OTP input.
  const MenoOtpField({
    super.key,
    this.controller,
    this.enabled = true,
    this.focusNode,
    this.length = 4,
    this.obscureText = false,
    this.onChanged,
    this.validator,
  });

  /// An optional controller for managing the text input.
  final TextEditingController? controller;

  /// A boolean to control whether the field is enabled. Defaults to true.
  final bool enabled;

  /// An optional focus node for managing focus.
  final FocusNode? focusNode;

  /// The number of OTP fields to display. Defaults to 4.
  final int length;

  /// A boolean to control whether the text should be obscured.
  /// Defaults to false.
  final bool obscureText;

  /// A callback function that is called when the text changes.
  final ValueChanged<String?>? onChanged;

  /// An optional function for validating the OTP input.
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    final textTheme = MenoTextTheme.of(context);
    final theme = MenoInputTheme.of(context);

    final defaultPinTheme = PinTheme(
      width: 80,
      height: 88,
      padding: const EdgeInsets.all(24),
      textStyle: textTheme.heading1Medium,

      decoration: BoxDecoration(
        borderRadius: MenoBorderRadius.md,
        border: Border.all(
          color: theme.defaultColor,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        width: 2,
        color: theme.focusedColor,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        width: 2,
        color: theme.errorColor,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
    );

    return Pinput(
      autofocus: true,
      controller: controller,
      enabled: enabled,
      focusNode: focusNode,
      length: length,
      obscureText: obscureText,
      obscuringCharacter: '*',
      onChanged: onChanged,
      validator: validator,
      showCursor: false,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      errorPinTheme: errorPinTheme,
    );
  }
}
