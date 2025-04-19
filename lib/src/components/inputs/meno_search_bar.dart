import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

///{@template meno_search_bar}
/// A custom implementation of the search bar
///{@endtemplate}
class MenoSearchBar extends StatelessWidget {
  /// {@macro meno_search_bar}
  const MenoSearchBar({
    required this.hintText,
    super.key,
    this.focusNode,
    this.onChanged,
    this.leading,
    this.trailing,
    this.enabled = true,
  });

  /// Text that suggests what sort of input the field accepts.
  final String hintText;

  /// An optional focus node to use as the focus node for this widget.
  final FocusNode? focusNode;

  /// Invoked upon user input.
  final void Function(String)? onChanged;

  /// A widget to display before the text input field.
  ///
  /// Typically the [leading] widget is an [Icon] or an [IconButton].
  ///
  final Widget? leading;

  /// A list of Widgets to display in a row after the text field.
  ///
  /// Typically these actions can represent additional modes of searching
  /// (like voice search), an avatar, a separate high-level action
  /// (such as current location) or an overflow menu. There should not be
  /// more than two trailing actions.
  ///
  final Iterable<Widget>? trailing;

  /// Whether or not this widget is currently interactive.
  /// 
  /// When false, the widget will ignore taps and appear dimmed.
  /// 
  /// Defaults to true.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colors = MenoColorScheme.of(context);
    return SearchBar(
      focusNode: focusNode,
      scrollPadding: EdgeInsets.zero,
      hintText: hintText,
      onChanged: onChanged,
      elevation: Internal.all(0),
      enabled: enabled,
      trailing: trailing,
      leading:
          leading ??
          Icon(MIcons.search, color: colors.labelPlaceholder, size: 16),
    );
  }
}
