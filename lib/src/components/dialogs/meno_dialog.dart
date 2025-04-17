import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

class _MenoDialogTitle extends StatelessWidget {
  const _MenoDialogTitle(this.data, {this.align = TextAlign.left});
  final String data;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return MenoText.heading2(
      data,
      textAlign: align,
      weight: MenoFontWeight.regular,
    );
  }
}

class _MenoDialogDescription extends StatelessWidget {
  const _MenoDialogDescription(this.data);
  final String data;

  @override
  Widget build(BuildContext context) {
    return MenoText.caption(
      data,
      textAlign: TextAlign.left,
      weight: MenoFontWeight.regular,
    );
  }
}

/// {@template meno_dialog}
/// A custom implementation of a dilaog
/// {@endtemplate}
class MenoDialog extends StatelessWidget {
  /// {@macro meno_dialog}
  const MenoDialog({
    required this.title,
    required this.description,
    this.icon,
    this.primaryActionText = 'Okay',
    this.onPrimaryAction,
    this.secondaryActionText = 'Cancel',
    this.onSecondaryAction,
    this.content,
    this.isDanger = false,
    super.key,
  });

  /// Icon widget or Avatar widget
  final Widget? icon;

  /// Title of the dialog
  final String title;

  /// Description of the dialog
  final String description;

  /// Text label of the main action button.
  ///
  /// Example: `Continue`
  ///
  /// Defaults to `Okay`
  final String primaryActionText;

  /// Action triggered when the main action is pressed
  final VoidCallback? onPrimaryAction;

  /// Text label of the secondary action button.
  ///
  /// Example: `Close` or `Cancel`
  ///
  /// Defaults to `Cancel`
  final String secondaryActionText;

  /// Action triggered when the main action is pressed
  final VoidCallback? onSecondaryAction;

  /// Content that appears beneath the description
  final Widget? content;

  /// If the primary action should be a danger button
  final bool isDanger;

  @override
  Widget build(BuildContext context) {
    final colors = MenoColorScheme.of(context);

    return AlertDialog(
      backgroundColor: colors.sectionPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      icon:
          icon != null
              ? IconTheme(
                data: const IconThemeData(size: 22),
                child: Align(child: icon),
              )
              : null,
      alignment: Alignment.center,
      iconPadding: const EdgeInsets.only(top: 24),
      title: _MenoDialogTitle(
        title,
        align: icon != null ? TextAlign.center : TextAlign.left,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: _MenoDialogDescription(description),
          ),
          if (content != null) content!,
        ],
      ),
      actionsPadding: const EdgeInsets.all(24),
      titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      contentPadding: EdgeInsets.zero,
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        SizedBox(
          height: 40,
          child: MenoTertiaryButton(
            onPressed: onSecondaryAction ?? () => Navigator.maybePop(context),
            style: TextButton.styleFrom(foregroundColor: colors.labelHelp),
            child: Text(secondaryActionText),
          ),
        ),
        if (isDanger)
          SizedBox(
            height: 40,
            child: MenoDangerButton(
              onPressed: onPrimaryAction,
              child: Text(primaryActionText),
            ),
          )
        else
          SizedBox(
            height: 40,
            child: MenoPrimaryButton(
              onPressed: onPrimaryAction,
              child: Text(primaryActionText),
            ),
          ),
      ],
    );
  }
}
