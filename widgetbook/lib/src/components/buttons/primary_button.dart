import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Primary', type: PrimaryButton)
Widget buildPrimaryButtonUseCase(BuildContext context) {
  return PrimaryButton.icon(
    icon: Icon(Icons.person),
    label: context.knobs.string(label: 'Label', initialValue: 'HomePage'),
    size: MenoSize.sm,
    onTap: () {},
  );
}
