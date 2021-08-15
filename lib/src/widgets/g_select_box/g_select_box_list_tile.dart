import 'package:flutter/material.dart';
import 'package:google_ui/src/widgets/g_text/g_text.dart';

import 'g_select_box_item.dart';

class GSelectBoxListTile<T> extends StatelessWidget {
  const GSelectBoxListTile({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final GSelectBoxItem<T> item;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      title: GText(item.title),
      subtitle: item.subtitle != null
          ? GText(
              item.subtitle!,
              variant: GTextVariant.bodyText2,
              color: colorScheme.onBackground.withOpacity(.75),
            )
          : null,
      leading: item.icon,
      trailing:
          isSelected ? Icon(Icons.check, color: colorScheme.primary) : null,
      onTap: () => onTap(),
    );
  }
}
