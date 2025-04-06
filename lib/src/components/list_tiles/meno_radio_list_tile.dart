import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// A custom radio list tile built on top of [MenoListTile].
///
/// [MenoRadioListTile] is a convenience widget that combines a list tile with
/// a [Radio] button, allowing users to select one option from a group.
/// It behaves similarly to [RadioListTile], but integrates with the
/// Meno design system.
///
/// The tile is tappable, triggering the [onChanged] callback and selecting
/// the corresponding [value] if it's different from [groupValue].
///
/// The [headline] is required and displayed as the title of the tile.
///
/// Example usage:
///
/// ```dart
/// MenoRadioListTile<String>(
///   value: 'option1',
///   groupValue: selectedValue,
///   onChanged: (val) => setState(() => selectedValue = val),
///   headline: 'Option 1',
/// )
/// ```
///
/// Type parameter [T] represents the type of the value used in 
/// the radio group.
/// 
class MenoRadioListTile<T> extends MenoListTile {
  /// Creates a [MenoRadioListTile] with the given parameters.
  ///
  /// [headline] is required and is shown as the primary text.
  /// [value] and [groupValue] are used to determine whether this tile
  /// is selected.
  ///
  /// If [onChanged] is non-null, tapping the tile or the radio button will
  /// trigger the callback with the new value.
  ///
  /// [selected] visually highlights the tile as selected.
  /// [leading] can be used to display an icon or avatar on the left side.
  /// 
  MenoRadioListTile({
    required super.headline,
    required this.value,
    required this.groupValue,
    super.key,
    this.onChanged,
    super.selected,
    super.leading,
  }) : super(
         onTap: () => onChanged?.call(value),
         trailing: Radio<T>(
           value: value,
           groupValue: groupValue,
           onChanged: onChanged,
         ),
       );

  /// The value represented by this radio tile.
  final T value;

  /// The currently selected value in the radio group.
  final T? groupValue;

  /// Callback that gets called when the tile or radio button is tapped.
  ///
  /// If null, the radio tile is disabled.
  final void Function(T?)? onChanged;
}
