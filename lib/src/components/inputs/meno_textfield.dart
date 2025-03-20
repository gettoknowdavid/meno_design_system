import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_textfield}
/// A custom text field class for input with validation
/// {@endtemplate}
class MenoTextfield extends HookWidget {
  /// {@macro meno_textfield}
  const MenoTextfield({
    required this.placeholder,
    super.key,
    this.size = MenoSize.md,
    this.label,
    this.showLabel = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.isPassword = false,
    this.validator,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.initialValue,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.autofocus = false,
    this.labelIcon,
    this.enabled = true,
  });

  /// Text that suggests what sort of input the field accepts.
  final String placeholder;

  /// The size of [MenoTextfield]
  final MenoSize size;

  /// The [MenoInputLabel] data string
  final String? label;

  /// Flag to set the visibility of the [MenoInputLabel] widget
  final bool showLabel;

  /// An icon that appears before the editable part of the text field,
  /// within the decoration's container.
  final Widget? prefixIcon;

  /// An icon that appears after the editable part of the text field
  /// within the decoration's container.
  final Widget? suffixIcon;

  /// The maximum number of lines to display. Defaults to 1.
  final int maxLines;

  /// A boolean to control whether the field should obscure text for passwords.
  /// Defaults to false.
  final bool isPassword;

  /// An optional function for validating the input.
  final FormFieldValidator<String>? validator;

  /// An optional controller for managing the text.
  final TextEditingController? controller;

  /// A callback function that is called when the text changes.
  final ValueChanged<String>? onChanged;

  /// A callback function that is called when the field is submitted.
  final ValueChanged<String>? onFieldSubmitted;

  /// An optional initial value for the field.
  final String? initialValue;

  /// An optional focus node for managing focus.
  final FocusNode? focusNode;

  /// The type of keyboard to display. Defaults to [TextInputType.text].
  final TextInputType keyboardType;

  /// A boolean to control whether the text field should auto-focus. Defaults
  /// to false.
  final bool autofocus;

  /// An optional icon to display with the label.
  final Widget? labelIcon;

  /// A boolean to control whether the text field is enabled. Defaults to true.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = MenoInputTheme.of(context);

    final obscure = useState<bool>(isPassword);

    late final contentPadding = switch (size) {
      MenoSize.sm => const EdgeInsets.all(Insets.sm),
      MenoSize.md => const EdgeInsets.all(Insets.md),
      _ => const EdgeInsets.symmetric(
        horizontal: Insets.md,
        vertical: Insets.lg,
      ),
    };

    late final borderRadius = switch (size) {
      MenoSize.sm => const BorderRadius.all(Radius.circular(6)),
      _ => const BorderRadius.all(Radius.circular(Insets.sm)),
    };

    late final border = WidgetStateInputBorder.resolveWith((states) {
      late final BorderSide borderSide;
      if (states.contains(WidgetState.error)) {
        borderSide = BorderSide(width: 2, color: theme.errorBorderColor);
      } else if (states.contains(WidgetState.disabled)) {
        borderSide = BorderSide(color: theme.disabledBorderColor);
      } else if (states.contains(WidgetState.focused)) {
        borderSide = BorderSide(width: 2, color: theme.focusedBorderColor);
      } else {
        borderSide = BorderSide(color: theme.defaultBorderColor);
      }
      return OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: borderSide,
      );
    });

    // Adding the content padding to the box size of the icon
    late final iconConstraints = switch (size) {
      MenoSize.sm => BoxConstraints.tight(const Size.square(16 + Insets.sm)),
      MenoSize.md => BoxConstraints.tight(const Size.square(18 + Insets.md)),
      _ => BoxConstraints.tight(const Size.square(20 + Insets.md)),
    };

    Widget? prefixWidget;
    if (prefixIcon != null) {
      prefixWidget = MenoInputIcon(prefixIcon!, size: size);
    }

    Widget? suffixWidget;
    if (suffixIcon != null) {
      suffixWidget = MenoInputIcon(suffixIcon!, size: size);
    }

    if (isPassword) {
      suffixWidget = PasswordEye(obscureText: obscure.value, size: size);
    }

    return FormField(
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: enabled,
      initialValue: initialValue,
      builder: (field) {
        focusNode?.addListener(() {});
        final hasFocus = focusNode?.hasFocus ?? false;
        final labelColor =
            field.hasError
                ? theme.errorTextStyle.color
                : hasFocus
                ? theme.focusedBorderColor
                : theme.defaultBorderColor;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showLabel) ...[
              MenoInputLabel(label!, icon: labelIcon, color: labelColor),
              const SizedBox(height: Insets.sm),
            ],
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: theme.textStyle,
              cursorHeight: 18,
              cursorWidth: 1,
              cursorColor: theme.cursorColor,
              controller: controller,
              onChanged: onChanged,
              onFieldSubmitted: onFieldSubmitted,
              initialValue: initialValue,
              focusNode: focusNode,
              keyboardType: keyboardType,
              enabled: enabled,
              autofocus: autofocus,
              obscureText: obscure.value,
              decoration: InputDecoration(
                hintStyle: theme.textStyle,
                hintText: placeholder,
                fillColor: theme.fillColor,
                contentPadding: contentPadding,
                isDense: true,
                border: border,
                errorStyle: theme.errorTextStyle,
                prefixIconConstraints: iconConstraints,
                suffixIconConstraints: iconConstraints,
                prefixIcon: prefixWidget,
                suffixIcon: suffixWidget,
              ),
            ),
          ],
        );
      },
    );
  }
}
