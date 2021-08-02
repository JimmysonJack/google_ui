import 'package:flutter/material.dart';

/// Create popup menu item.
class GooglePopupMenuItem {
  final void Function() onPressed;
  final Widget? icon;
  final String label;

  GooglePopupMenuItem({
    required this.onPressed,
    this.icon,
    required this.label,
  });
}

/// Create popup menu button.
class GooglePopupMenuButton extends StatelessWidget {
  const GooglePopupMenuButton({Key? key, required this.children})
      : super(key: key);

  /// A list of [GooglePopupMenuItem] to display as [GooglePopupMenuButton] children.
  final List<GooglePopupMenuItem> children;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<void Function()>(
      itemBuilder: (context) => children
          .map(
            (e) => PopupMenuItem(
              value: e.onPressed,
              child: e.icon != null
                  ? Row(
                      children: [
                        e.icon!,
                        const SizedBox(width: 16),
                        Text(e.label),
                      ],
                    )
                  : Text(e.label),
            ),
          )
          .toList(),
      onSelected: (value) => value(),
    );
  }
}
