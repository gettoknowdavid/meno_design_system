import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'SecondaryTopBar', type: MenoTopBar)
Widget buildSecondaryTopBarUseCase(BuildContext context) {
  return Scaffold(
    appBar: MenoTopBar.secondary(
      title: context.knobs.string(label: 'Title', initialValue: 'Title'),
      onBackButtonPressed: () {},
      titleSize: context.knobs.list(
        label: 'Title Size',
        options: MenoSize.values,
        labelBuilder: (value) => value.toName,
      ),
      centerTitle: context.knobs.boolean(label: 'Center Title'),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.star_outline)),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
      ],
    ),
  );
}
