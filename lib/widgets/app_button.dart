import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.textButton,
  });

  final VoidCallback? onPressed;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0066FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        fixedSize: const Size(double.maxFinite, 48),
      ),
      child: Text(
        textButton,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }
}
