import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'MenoOtpField', type: MenoOtpField)
Widget buildMenoOtpFieldUseCase(BuildContext context) {
  final focusNode = FocusNode();
  final controller = TextEditingController();
  return Scaffold(
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Focus(
        child: MenoOtpField(
          focusNode: focusNode,
          enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
          controller: controller,
          obscureText: context.knobs.boolean(label: 'Obscure Text'),
          onChanged: (value) {},
          validator: (value) {
            if (value?.isEmpty ?? false) return 'Cannot be empty';
            return null;
          },
        ),
      ),
    ),
  );
}
