import 'package:flutter/material.dart';

class BackIcon extends StatelessWidget {

  final VoidCallback onClick;

  const BackIcon({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(50),
      child: Ink(
        width: 42,
        height: 42,
        decoration: const BoxDecoration(
          color: Color(0xFFF4F4F4),
          shape: BoxShape.circle
        ),
        child: const Icon(
          Icons.arrow_back_ios_rounded,
          color: Color(0xFF1E1E2D),
          size: 20,
        ),
      ),
    );
  }
}
