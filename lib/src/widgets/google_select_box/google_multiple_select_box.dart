import 'package:flutter/material.dart';

import 'google_select_box_item.dart';
import 'google_select_box_list_tile.dart';

/// Create a multple select box.
class GoogleMultipleSelectBox<T> extends StatelessWidget {
  const GoogleMultipleSelectBox({
    Key? key,
    required this.values,
    this.minSelections,
    this.maxSelections,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  /// Mark item if [item.values] is contains [value].
  final List<T> values;

  /// Limit selection. default 1.
  final int? minSelections;

  /// Limit selection. default [items.length]
  final int? maxSelections;

  /// A list [GoogleSelectBoxItem] to display as option to select.
  final List<GoogleSelectBoxItem> items;

  /// A callback after user select an option.
  final void Function(List<T> values) onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final List<Widget> children = [];

    void onGoogleSelectBoxListTileTap(int index) {
      final item = items[index];
      final newValues = values;
      final min = minSelections ?? 1;
      final max = maxSelections ?? items.length;

      if (newValues.contains(item.value)) {
        newValues.removeWhere((e) => e == item.value);
      } else {
        newValues.add(item.value);
      }

      if (newValues.length > max || newValues.length < min) {
        return;
      }

      onChanged(newValues);
    }

    for (int i = 0; i < items.length; i++) {
      children.add(GoogleSelectBoxListTile(
        label: items[i].label,
        isSelected: values.contains(items[i].value),
        onTap: () => onGoogleSelectBoxListTileTap(i),
        colorScheme: colorScheme,
      ));

      if (i != items.length - 1) {
        children.add(const Divider(height: 0, indent: 16));
      }
    }

    return Column(children: children);
  }
}
