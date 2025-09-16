import 'package:flutter/material.dart';

class AppSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    required VoidCallback onPressed,
    String label = "OK",
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(label: label, onPressed: onPressed),
      ),
    );
  }
}
