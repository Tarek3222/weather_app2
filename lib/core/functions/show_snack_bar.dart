import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String text,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.indigo,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(20),
      shape: const StadiumBorder(),
      dismissDirection: DismissDirection.up,
    ),
  );
}
