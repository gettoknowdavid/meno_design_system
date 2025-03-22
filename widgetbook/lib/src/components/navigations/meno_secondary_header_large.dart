import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'SecondaryHeaderLarge', type: MenoHeader)
Widget buildSecondaryLargeHeaderUseCase(BuildContext context) {
  final colors = MenoColorScheme.of(context);
  return Scaffold(
    appBar: MenoHeader.secondaryLarge(
      title: Text(context.knobs.string(label: 'Title', initialValue: 'Header')),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(MIcons.bell_04)),
        CircleAvatar(
          radius: 16,
          backgroundColor: colors.componentSecondary,
          foregroundColor: colors.labelPlaceholder,
          child: const Icon(MIcons.user_circle, size: 18),
        ),
      ],
    ),
  );
}
