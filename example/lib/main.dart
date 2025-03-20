import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MenoTheme.light,
      darkTheme: MenoTheme.dark,
      themeMode: ThemeMode.light,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(Insets.xlg),
            child: Column(
              spacing: Insets.lg,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hello World!'),
                PrimaryButton.icon(
                  label: 'Button',
                  icon: Icon(Icons.abc),
                  onTap: () {},
                  size: MenoSize.xs,
                ),
                PrimaryButton(label: 'Button', onTap: () {}, size: MenoSize.sm),
                PrimaryButton(label: 'Button', onTap: () {}, size: MenoSize.md),
                PrimaryButton(label: 'Button', onTap: () {}, size: MenoSize.lg),
                MenoTextfield(
                  placeholder: 'Placeholder Text',
                  size: MenoSize.sm,
                  showLabel: true,
                  label: "Input label",
                  prefixIcon: Icon(Icons.person),
                  isPassword: true,
                ),
                MenoTextfield(
                  placeholder: 'Placeholder Text',
                  size: MenoSize.md,
                ),
                MenoTextfield(
                  placeholder: 'Placeholder Text',
                  size: MenoSize.lg,
                  prefixIcon: Icon(Icons.person),
                  validator: (value) {
                    if (value?.isEmpty ?? false) return 'Cannot be empty';
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
