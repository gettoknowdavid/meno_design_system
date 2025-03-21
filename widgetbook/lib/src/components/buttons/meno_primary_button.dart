import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'MenoPrimary', type: MenoPrimaryButton)
Widget buildMenoPrimaryButtonUseCase(BuildContext context) {
  final disabledKnob = context.knobs.boolean(label: 'Disabled');
  final isLoadingKnob = context.knobs.boolean(label: 'Loading');
  final labelKnob = Text(
    context.knobs.string(label: 'Label', initialValue: 'Button Text'),
  );
  final iconAlignmentKnob = context.knobs.list(
    label: 'Icon Alignment',
    options: IconAlignment.values,
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
            MenoPrimaryButton(
              size: size,
              onPressed: () {},
              disabled: disabledKnob,
              isLoading: isLoadingKnob,
              child: labelKnob,
            ),
          ],
        ],
      ),

      Wrap(
        spacing: 48,
        children: [
          for (MenoSize size in MenoSize.values) ...[
            MenoPrimaryButton.icon(
              size: size,
              onPressed: () {},
              disabled: disabledKnob,
              isLoading: isLoadingKnob,
              label: labelKnob,
              icon: Icon(Icons.person),
              iconAlignment: iconAlignmentKnob,
            ),
          ],
        ],
      ),
    ],
  );
}
