// Removes the warning for the trailing commas after the dependencies is the
// `usetState` and `useMemoized` values.
// ignore_for_file: require_trailing_commas

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:meno_design_system/src/components/inputs/meno_input_icon.dart';

/// {@template meno_textfield}
/// A custom text field class for input with validation
/// {@endtemplate}
class MenoTextfield extends FormField<String> {
  /// {@macro meno_textfield}
  MenoTextfield({
    required this.placeholder,
    super.key,
    this.size = MenoSize.md,
    super.validator,
    this.label,
    this.showLabel = false,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.controller,
    this.onChanged,
    super.autovalidateMode,
    this.onFieldSubmitted,
    super.initialValue,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.autofocus = false,
    this.labelIcon,
    super.enabled = true,
    this.required = true,
  }) : super(
         builder: (field) {
           void onChangedHandler(String value) {
             field.didChange(value);
             onChanged?.call(value);
           }

           return _TextfieldWidget(
             key: key,
             placeholder: placeholder,
             size: size,
             controller: controller,
             onChanged: onChangedHandler,
             focusNode: focusNode,
             keyboardType: keyboardType,
             enabled: enabled,
             autofocus: autofocus,
             prefixIcon: prefixIcon,
             suffixIcon: suffixIcon,
             labelIcon: labelIcon,
             isPassword: isPassword,
             label: label,
             hasError: field.hasError || !field.isValid,
             errorText: field.errorText,
             isEmpty: field.value?.isEmpty ?? false,
             validator: validator,
             initialValue: initialValue,
             required: required,
           );
         },
       );

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
  final IconData? prefixIcon;

  /// An icon that appears after the editable part of the text field
  /// within the decoration's container.
  final IconData? suffixIcon;

  /// A boolean to control whether the field should obscure text for passwords.
  /// Defaults to false.
  final bool isPassword;

  /// An optional controller for managing the text.
  final TextEditingController? controller;

  /// A callback function that is called when the text changes.
  final ValueChanged<String>? onChanged;

  /// A callback function that is called when the field is submitted.
  final ValueChanged<String>? onFieldSubmitted;

  /// An optional focus node for managing focus.
  final FocusNode? focusNode;

  /// The type of keyboard to display. Defaults to [TextInputType.text].
  final TextInputType keyboardType;

  /// A boolean to control whether the text field should auto-focus. Defaults
  /// to false.
  final bool autofocus;

  /// An optional icon to display with the label.
  final IconData? labelIcon;

  /// A boolean indicating whether the field is required. Defaults to false.
  final bool required;

  @override
  _MenoTextfieldState createState() => _MenoTextfieldState();
}

class _MenoTextfieldState extends FormFieldState<String> {
  @override
  MenoTextfield get widget => super.widget as MenoTextfield;
}

InputBorder _border(BuildContext context, MenoSize size) {
  final theme = MenoInputTheme.of(context);

  late final borderRadius = switch (size) {
    MenoSize.md => const BorderRadius.all(Radius.circular(Insets.sm)),
    MenoSize.lg => const BorderRadius.all(Radius.circular(Insets.sm)),
    _ => const BorderRadius.all(Radius.circular(6)),
  };

  return WidgetStateInputBorder.resolveWith((states) {
    var side = const BorderSide(strokeAlign: BorderSide.strokeAlignOutside);
    if (states.contains(WidgetState.error)) {
      side = side.copyWith(width: 2, color: theme.errorColor);
    } else if (states.contains(WidgetState.disabled)) {
      side = side.copyWith(color: theme.disabledColor);
    } else if (states.contains(WidgetState.focused)) {
      side = side.copyWith(width: 2, color: theme.focusedColor);
    } else {
      side = side.copyWith(color: theme.defaultColor);
    }

    return OutlineInputBorder(borderRadius: borderRadius, borderSide: side);
  });
}

EdgeInsetsGeometry _contentPadding(MenoSize size) {
  return switch (size) {
    MenoSize.lg => const EdgeInsets.symmetric(
      horizontal: Insets.md,
      vertical: Insets.lg,
    ),
    MenoSize.md => const EdgeInsets.all(Insets.md),
    _ => const EdgeInsets.all(Insets.sm),
  };
}

BoxConstraints _iconConstraints(MenoSize size) {
  return switch (size) {
    MenoSize.lg => BoxConstraints.tight(const Size(32, 48)),
    MenoSize.md => BoxConstraints.tight(const Size(28, 40)),
    _ => BoxConstraints.tight(const Size(24, 32)),
  };
}

class _TextfieldWidget extends HookWidget {
  const _TextfieldWidget({
    required this.placeholder,
    required this.size,
    required this.onChanged,
    required this.hasError,
    required this.errorText,
    this.controller,
    super.key,
    this.focusNode,
    this.keyboardType,
    this.label,
    this.enabled = false,
    this.autofocus = false,
    this.isPassword = false,
    this.isEmpty = false,
    this.prefixIcon,
    this.suffixIcon,
    this.labelIcon,
    this.validator,
    this.initialValue,
    this.required = false,
  });

  final String placeholder;
  final MenoSize size;
  final String? label;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final bool enabled;
  final bool autofocus;
  final bool isPassword;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final IconData? labelIcon;
  final bool hasError;
  final bool isEmpty;
  final String? errorText;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final bool required;

  @override
  Widget build(BuildContext context) {
    final theme = MenoInputTheme.of(context);
    final border = useMemoized(() => _border(context, size), [context, size]);
    final contentPadding = useMemoized(() => _contentPadding(size), [size]);
    final iconConstraints = useMemoized(() => _iconConstraints(size), [size]);

    final obscureText = useState(isPassword);
    final focus = focusNode ?? useMemoized(FocusNode.new, []);
    final hasFocus = useState(focus?.hasFocus ?? false);

    useEffect(() {
      void listener() => hasFocus.value = focus?.hasFocus ?? false;
      focus?.addListener(listener);
      return () => focus?.removeListener(listener);
    }, [focus]);

    final effectiveColor = useMemoized(() {
      if (hasError) return theme.errorColor;
      if (!enabled) return theme.disabledColor;
      if (hasFocus.value) return theme.focusedLabelColor;
      if (isEmpty) return theme.defaultColor;
      return theme.defaultColor;
    }, [hasError, enabled, hasFocus, isEmpty, theme]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null && label!.isNotEmpty) ...[
          MenoInputLabel(
            label!,
            icon: labelIcon,
            color: effectiveColor,
            required: required,
            enabled: enabled,
          ),
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
          initialValue: initialValue,
          validator: validator,
          focusNode: focus,
          keyboardType: keyboardType,
          enabled: enabled,
          autofocus: autofocus,
          obscureText: obscureText.value,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            hintStyle: theme.textStyle,
            hintText: placeholder,
            fillColor: theme.fillColor,
            filled: !enabled,
            contentPadding: contentPadding,
            isDense: true,
            border: border,
            prefixIconColor: theme.iconColor,
            suffixIconColor: theme.iconColor,
            errorStyle: theme.errorTextStyle,
            errorText: errorText,
            prefixIconConstraints: iconConstraints,
            suffixIconConstraints: iconConstraints,
            prefixIcon:
                prefixIcon != null
                    ? MenoInputIcon(prefixIcon!, size: size)
                    : null,
            suffixIcon:
                isPassword
                    ? PasswordEye(
                      obscureText: obscureText.value,
                      onToggle: (value) => obscureText.value = value,
                    )
                    : null,
          ),
        ),
      ],
    );
  }
}
