import 'package:flutter/material.dart';

class HorizontalItem extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  final Icon? iconLeft;
  final Widget? rightItem;
  final bool showDivider;

  static const Icon _defaultRightIcon = Icon(
    Icons.arrow_forward_ios,
    color: Color(0xFF7E848D),
    size: 16,
  );

  const HorizontalItem({
    super.key,
    required this.title,
    required this.onClick,
    this.rightItem = _defaultRightIcon,
    this.iconLeft,
    this.showDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onClick,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (iconLeft != null) ...[iconLeft!, const SizedBox(width: 16)],
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF1E1E2D),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (rightItem != null) ...[const SizedBox(width: 16), rightItem!],
              ],
            ),
          ),
        ),
        if (showDivider) const Divider(color: Color(0xFFF4F4F4)),
      ],
    );
  }
}
