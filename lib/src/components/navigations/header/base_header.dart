import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart'
    show Internal, MenoSize;
import 'package:meno_design_system/src/components/navigations/navigations.dart';
import 'package:meno_design_system/src/theme/theme.dart';

/// {@template base_meno_header}
/// The BaseHeader
/// {@endtemplate}
abstract class BaseHeader extends StatelessWidget
    implements PreferredSizeWidget {
  /// {@macro base_meno_header}
  const BaseHeader({
    required this.title,
    required this.headerHeight,
    this.size = MenoSize.md,
    super.key,
    this.label,
    this.actions,
    this.actionLabel,
    this.actionCallback,
    this.margin,
  });

  /// The [MenoSize]
  final MenoSize size;

  /// The title of the header
  final Widget title;

  /// The label of the header
  final String? label;

  /// List of action buttons
  final List<Widget>? actions;

  /// Special optional action label for action button
  final String? actionLabel;

  /// Special optional action callback for action button
  final VoidCallback? actionCallback;

  /// Height of the header
  final double headerHeight;

  /// Margin
  final EdgeInsets? margin;

  /// The default styling of the header
  @protected
  HeaderStyle defaultStyleOf(BuildContext context);

  /// Returns the HeaderStyle that belongs to the header's component theme
  @protected
  HeaderStyle? themeStyleOf(BuildContext context);

  @override
  Size get preferredSize => Size.fromHeight(headerHeight);

  @override
  Widget build(BuildContext context) {
    final themeStyle = themeStyleOf(context);
    final defaultStyle = defaultStyleOf(context);

    T? effectiveValue<T>(T? Function(HeaderStyle? style) getProperty) {
      final themeValue = getProperty(themeStyle);
      final defaultValue = getProperty(defaultStyle);
      return themeValue ?? defaultValue;
    }

    T? resolve<T>(T? Function(HeaderStyle? style) getProperty) {
      return effectiveValue((HeaderStyle? style) => getProperty(style));
    }

    final padding = resolve<EdgeInsetsGeometry?>((style) => style?.padding);
    final backgroundColor = resolve<Color?>((style) => style?.backgroundColor);
    final showSideBorder = resolve<bool?>((style) => style?.showSideBorder);
    final sideBorderThickness = resolve<double?>(
      (style) => style?.sideBorderThickness,
    );
    final sideBorderColor = resolve<Color?>((style) => style?.sideBorderColor);
    final titleStartGap = resolve<double?>((style) => style?.titleStartGap);
    final titleEndGap = resolve<double?>((style) => style?.titleEndGap);
    final labelTextStyle = resolve<TextStyle?>(
      (style) => style?.labelTextStyle,
    );
    final titleTextStyle = resolve<TextStyle?>(
      (style) => style?.titleTextStyle,
    );
    final actionLabelTextStyle = resolve<TextStyle?>(
      (style) => style?.actionLabelTextStyle,
    );
    final actionsSpacing = resolve<double?>((style) => style?.actionsSpacing);

    return Semantics(
      container: true,
      child: SafeArea(
        child: Container(
          height: headerHeight,
          width: double.infinity,
          padding: padding,
          margin: margin,
          decoration: BoxDecoration(color: backgroundColor),
          child: Row(
            children: [
              if (showSideBorder ?? false) ...[
                MenoHeaderSideBar(
                  thickness: sideBorderThickness,
                  color: sideBorderColor,
                ),
                SizedBox(width: titleStartGap),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (label != null) Text(label!, style: labelTextStyle),
                    DefaultTextStyle(
                      style: titleTextStyle ?? const TextStyle(),
                      child: title,
                    ),
                  ],
                ),
              ),
              SizedBox(width: titleEndGap),
              if (actions?.isNotEmpty ?? false)
                Row(spacing: actionsSpacing ?? 0, children: actions!),
              if (actionLabel != null)
                SizedBox(
                  width: 41,
                  child: TextButton(
                    onPressed: actionCallback,
                    style: ButtonStyle(
                      padding: Internal.all(EdgeInsets.zero),
                      textStyle: Internal.all(actionLabelTextStyle),
                    ),
                    child: Text(actionLabel!),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
