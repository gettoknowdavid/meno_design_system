import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'SecondaryHeader', type: MenoHeader)
Widget buildSecondaryHeaderUseCase(BuildContext context) {
  return Scaffold(
    appBar: MenoHeader.secondary(
      title: Text(context.knobs.string(label: 'Title', initialValue: 'Header')),
      // actionLabel: context.knobs.string(label: 'Action Label'),
      // actionCallback: () {},
      size: context.knobs.list(
        label: 'Size',
        options: MenoSize.values,
        labelBuilder: (value) => value.toName,
        initialOption: MenoSize.md,
      ),
    ),
  );
}
