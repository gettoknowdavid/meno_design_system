// Removes the warning for the trailing commas after the dependencies is the
// `usetState` and `useMemoized` values.
// ignore_for_file: require_trailing_commas

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_textbox}
/// A custom text area class
/// {@endtemplate}
class MenoTextbox extends FormField<String> {
  /// {@macro meno_textbox}
  MenoTextbox({
    super.key,
    this.label,
    this.labelIcon,
    super.initialValue,
    super.autovalidateMode = AutovalidateMode.onUserInteraction,
    super.enabled = true,
    super.validator,
    this.placeholder,
    this.maxLength = 244,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.required = false,
    this.textInputAction,
    this.size = MenoSize.md,
    this.autofocus = false,
    this.maxLines,
    this.minLines,
    this.showCounter = true,
    this.contentPadding = const EdgeInsets.all(Insets.md),
  }) : super(
         builder: (field) {
           void onChangedHandler(String value) {
             field.didChange(value);
             onChanged?.call(value);
           }

           return _Textbox(
             key: key,
             label: label,
             autofocus: autofocus,
             autovalidateMode: autovalidateMode,
             controller: controller,
             enabled: enabled,
             focusNode: focusNode,
             initialValue: initialValue,
             keyboardType: keyboardType,
             labelIcon: labelIcon,
             maxLength: maxLength,
             onChanged: onChangedHandler,
             placeholder: placeholder,
             required: required,
             size: size,
             textInputAction: textInputAction,
             validator: validator,
             errorText: field.errorText,
             hasError: field.hasError || !field.isValid,
             isEmpty: field.value?.isEmpty ?? false,
             maxLines: maxLines,
             minLines: minLines,
             showCounter: showCounter,
             contentPadding: contentPadding,
           );
         },
       );

  /// The label for the text area.
  final String? label;

  /// An optional icon to display with the label.
  final IconData? labelIcon;

  /// An optional placeholder text to display when the field is empty.
  final String? placeholder;

  /// An optional maximum number of characters.
  final int maxLength;

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

  /// A boolean to indicate if the field is required. Defaults to false.
  final bool required;

  /// An optional action to display on the keyboard.
  final TextInputAction? textInputAction;

  /// [MenoSize]
  final MenoSize size;

  /// Autofocus
  final bool autofocus;

  /// Max lines
  final int? maxLines;

  /// Min lines
  final int? minLines;

  /// Whether to show counter
  final bool showCounter;

  /// Content Padding
  final EdgeInsetsGeometry contentPadding;

  @override
  _MenoTextboxState createState() => _MenoTextboxState();
}

class _MenoTextboxState extends FormFieldState<String> {
  @override
  MenoTextbox get widget => super.widget as MenoTextbox;
}

class _Textbox extends HookWidget {
  const _Textbox({
    required this.placeholder,
    required this.hasError,
    required this.errorText,
    required this.onChanged,
    super.key,
    this.label,
    this.isEmpty = false,
    this.labelIcon,
    this.enabled = true,
    this.maxLength,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.autovalidateMode,
    this.required = false,
    this.textInputAction,
    this.size = MenoSize.md,
    this.autofocus = false,
    this.maxLines = 5,
    this.minLines = 1,
    this.showCounter = true,
    this.contentPadding = const EdgeInsets.all(Insets.md),
  });

  final String? label;
  final IconData? labelIcon;
  final String? placeholder;
  final bool enabled;
  final int? maxLength;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? initialValue;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final bool required;
  final TextInputAction? textInputAction;
  final MenoSize size;
  final bool autofocus;
  final bool hasError;
  final bool isEmpty;
  final String? errorText;
  final int? maxLines;
  final int? minLines;
  final bool showCounter;
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    final theme = MenoInputTheme.of(context);
    final border = useMemoized(() => _border(context, size), [context, size]);
    final effectiveMaxLines =
        maxLines ?? useMemoized(() => _maxLines(size), [size]);

    final focus = focusNode ?? useMemoized(FocusNode.new, []);
    final hasFocus = useState(focus?.hasFocus ?? false);

    final effectiveController = useTextEditingController(
      text: controller?.text ?? initialValue,
    );

    useEffect(() {
      void listener() => hasFocus.value = focus?.hasFocus ?? false;
      focus?.addListener(listener);
      return () => focus?.removeListener(listener);
    }, [focus]);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null || showCounter) ...[
          Row(
            children: [
              if (label != null) ...[
                MenoInputLabel(
                  label!,
                  icon: labelIcon,
                  required: required,
                  enabled: enabled,
                ),
              ],
              if (showCounter) ...[
                const Spacer(),
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: effectiveController,
                  builder: (context, value, child) {
                    return MenoInputCounter(
                      maxLength: maxLength ?? 244,
                      currentLength: value.text.length,
                      enabled: hasFocus.value && (!hasError || !isEmpty),
                    );
                  },
                ),
              ],
            ],
          ),
          const SizedBox(height: Insets.sm),
        ],
        TextFormField(
          autovalidateMode: autovalidateMode,
          style: theme.textStyle,
          cursorHeight: 18,
          cursorWidth: 1,
          cursorColor: theme.cursorColor,
          controller: effectiveController,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          focusNode: focus,
          maxLength: maxLength,
          maxLines: effectiveMaxLines,
          minLines: minLines,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          keyboardType: keyboardType,
          enabled: enabled,
          autofocus: autofocus,
          decoration: InputDecoration(
            hintStyle: theme.textStyle,
            hintText: placeholder,
            fillColor: theme.fillColor,
            filled: !enabled,
            contentPadding: contentPadding,
            counter: const SizedBox(),
            isDense: true,
            border: border,
            prefixIconColor: theme.iconColor,
            suffixIconColor: theme.iconColor,
            errorStyle: theme.errorTextStyle,
            errorText: errorText,
          ),
        ),
      ],
    );
  }
}

int _maxLines(MenoSize size) => switch (size) {
  MenoSize.md => 5,
  MenoSize.lg => 6,
  _ => 3,
};

InputBorder _border(BuildContext context, MenoSize size) {
  final theme = MenoInputTheme.of(context);

  late final borderRadius = switch (size) {
    MenoSize.lg => MenoBorderRadius.md,
    _ => MenoBorderRadius.sm,
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
