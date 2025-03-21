import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'TopBar', type: MenoTopBar)
Widget buildTopBarUseCase(BuildContext context) {
  return Scaffold(
    appBar: MenoTopBar(
      title: context.knobs.string(label: 'Title', initialValue: 'Home'),
      backLabelText: context.knobs.string(
        label: 'Back Label Text',
        initialValue: 'Back',
      ),
      type: context.knobs.list(
        label: 'Type',
        options: TopBarType.values,
        labelBuilder: (value) => value.name.toUpperCase(),
      ),
      titleSize: context.knobs.list(
        label: 'Title Size',
        options: TopBarTitleSize.values,
        labelBuilder: (value) => value.name.toUpperCase(),
      ),
      implyLeading: context.knobs.boolean(label: 'Imply Leading'),
      centerTitle: context.knobs.boolean(label: 'Center Title'),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.star_outline)),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
      ],
    ),
  );
}
