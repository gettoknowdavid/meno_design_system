import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_checkbox}
/// A custom meno checkbox input field with validation and error message
/// {@endtemplate}

class MenoCheckbox extends FormField<bool> {
  /// {@macro meno_checkbox}
  MenoCheckbox({
    required this.value,
    this.onChanged,
    super.validator,
    super.key,
    this.label,
    this.focusNode,
    this.autofocus = false,
    this.isError = false,
    this.semanticLabel,
  }) : super(
         initialValue: value,
         builder: (field) {
           void onChangedHandler(bool? value) {
             field.didChange(value);
             onChanged?.call(value);
           }

           return _Checkbox(
             key: key,
             field: field,
             label: label,
             isError: isError,
             onChanged: onChangedHandler,
           );
         },
       );

  /// Whether this checkbox is checked.
  final bool? value;

  /// Called when the value of the checkbox should change.
  final ValueChanged<bool?>? onChanged;

  /// Label for the checkbox
  final Widget? label;

  /// FocusNode for the checkbox
  final FocusNode? focusNode;

  /// Whether the checkbox should be focused once mounted
  final bool autofocus;

  /// If there is a validation error
  final bool isError;

  /// The semantic label for the checkbox that will be announced by screen
  /// readers.
  final String? semanticLabel;
  @override
  _MenoCheckboxState createState() => _MenoCheckboxState();
}

class _MenoCheckboxState extends FormFieldState<bool> {
  @override
  MenoCheckbox get widget => super.widget as MenoCheckbox;
}

class _Checkbox extends StatelessWidget {
  const _Checkbox({
    required this.field,
    super.key,
    this.label,
    this.onChanged,
    this.isError = false,
  });

  final Widget? label;
  final FormFieldState<bool> field;
  final ValueChanged<bool?>? onChanged;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    final hasError = isError || field.hasError || field.errorText != null;
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 16),
          child: Row(
            children: [
              Checkbox(
                value: field.value,
                onChanged: onChanged,
                isError: hasError,
              ),
              if (label != null) ...[const MenoSpacer.h(8), label!],
            ],
          ),
        ),
        if (hasError) ...[
          const MenoSpacer.v(Insets.xs),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 32),
            child: MenoText.caption(
              field.errorText!,
              color: MenoColorScheme.of(context).errorBase,
              weight: MenoFontWeight.regular,
            ),
          ),
        ],
      ],
    );
  }
}
