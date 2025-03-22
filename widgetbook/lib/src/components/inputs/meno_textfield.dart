import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'MenoTextfield', type: MenoTextfield)
Widget buildMenoTextfieldUseCase(BuildContext context) {
  final focusScopeNode = FocusScopeNode();
  final focusNode = FocusNode();
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
                  child: MenoTextfield(
                    focusNode: focusNode,
                    placeholder: context.knobs.string(
                      label: 'Title',
                      initialValue: 'johndoe@gmail.com',
                    ),
                    enabled: context.knobs.boolean(
                      label: 'Enabled',
                      initialValue: true,
                    ),
                    prefixIcon: MIcons.user,
                    size: size,
                    isPassword: context.knobs.boolean(label: 'Is Password'),
                    suffixIcon: MIcons.chevron_down,
                    label: context.knobs.string(
                      label: 'Label Text',
                      initialValue: 'Email Address',
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
