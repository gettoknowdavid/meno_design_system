import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'main.directories.g.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() {
  runApp(const MenoWidgetbookApp());
}

@widgetbook.App()
class MenoWidgetbookApp extends StatelessWidget {
  const MenoWidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: MenoTheme.light),
            WidgetbookTheme(name: 'Dark', data: MenoTheme.dark),
          ],
        ),
      ],
    );
  }
}
