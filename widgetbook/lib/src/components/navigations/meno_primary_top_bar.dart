import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'PrimaryTopBar', type: MenoTopBar)
Widget buildPrimaryTopBarUseCase(BuildContext context) {
  return Scaffold(
    appBar: MenoTopBar.primary(
      title: context.knobs.string(label: 'Title', initialValue: 'Title'),
      backLabelText: context.knobs.string(
        label: 'Back Button Label',
        initialValue: 'Back',
      ),
      implyLeading: context.knobs.boolean(label: 'Imply Leading'),
      onBackButtonPressed: () {},
    ),
  );
}
