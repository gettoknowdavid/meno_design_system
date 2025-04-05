import 'package:flutter/widgets.dart';

/// Extension helper to get the values for [WidgetStateProperty]s
extension WidgetStatePropertyX<T> on WidgetStateProperty<T> {
  /// Disabled value
  T get disabledValue => resolve({WidgetState.disabled});

  /// Dragged value
  T get draggedValue => resolve({WidgetState.dragged});

  /// Error value
  T get errorValue => resolve({WidgetState.error});

  /// Focused value
  T get focusedValue => resolve({WidgetState.focused});

  /// Hovered value
  T get hoveredValue => resolve({WidgetState.hovered});

  /// Pressed value
  T get pressedValue => resolve({WidgetState.pressed});

  /// Selected value
  T get selectedValue => resolve({WidgetState.selected});

  /// Scrolled Under value
  T get scrolledUnderValue => resolve({WidgetState.scrolledUnder});

  /// None value
  T get noneValue => resolve({});
}
