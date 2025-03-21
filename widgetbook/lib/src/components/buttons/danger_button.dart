import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'MenoDanger', type: MenoDangerButton)
Widget buildMenoDangerButtonUseCase(BuildContext context) {
  final disabledKnob = context.knobs.boolean(label: 'Disabled');
  final isLoadingKnob = context.knobs.boolean(label: 'Loading');
  final labelKnob = Text(
    context.knobs.string(label: 'Label', initialValue: 'Button Text'),
  );

  final dangerVariantKnob = context.knobs.list(
    label: 'Variant',
    options: MenoDangerButtonVariant.values,
  );

  return Column(
    spacing: 48,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Wrap(
        spacing: 48,
        children: [
          for (MenoSize size in MenoSize.values) ...[
            MenoDangerButton(
              size: size,
              onPressed: () {},
              disabled: disabledKnob,
              isLoading: isLoadingKnob,
              variant: dangerVariantKnob,
              child: labelKnob,
            ),
          ],
        ],
      ),
    ],
  );
}
