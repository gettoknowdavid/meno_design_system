import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'MenoTextbox', type: MenoTextbox)
Widget buildMenoTextboxUseCase(BuildContext context) {
  final focusScopeNode = FocusScopeNode();
  final focusNode = FocusNode();
  final controller = TextEditingController();
  return Scaffold(
    body: SingleChildScrollView(
      padding: EdgeInsets.all(16),
      scrollDirection: Axis.horizontal,
      child: FocusScope(
        node: focusScopeNode,
        child: Row(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (MenoSize size in MenoSize.values) ...[
              SizedBox(
                width: 276,
                child: Focus(
                  child: MenoTextbox(
                    focusNode: focusNode,
                    placeholder: context.knobs.string(
                      label: 'Placeholder',
                      initialValue: 'Placeholder Text',
                    ),
                    enabled: context.knobs.boolean(
                      label: 'Enabled',
                      initialValue: true,
                    ),
                    controller: controller,
                    size: size,
                    label: context.knobs.string(
                      label: 'Input Label',
                      initialValue: 'Input Label',
                    ),
                    onChanged: (value) {},
                    labelIcon: MIcons.info_circle,
                    validator: (value) {
                      if (value?.isEmpty ?? false) return 'Cannot be empty';
                      return null;
                    },
                    required: context.knobs.boolean(label: 'Required'),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    ),
  );
}
