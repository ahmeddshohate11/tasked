import 'package:flutter/material.dart';

void showLoading(BuildContext context, String text) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 20),
            Text(text),
          ],
        ),
      );
    },
  );
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}

void showMessage(
  BuildContext context,
  String message,
  String posActionText,
  Function postAction,
) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              postAction(context);
            },
            child: Text(posActionText),
          ),
        ],
      );
    },
  );
}
