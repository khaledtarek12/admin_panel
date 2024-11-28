import 'package:flutter/material.dart';

class TDialogs {
  static defaultDialog({
    required BuildContext context,
    String title = 'Removal Confirmation',
    String content =
        'Removing this data witt delete all related data. Are you sure?',
    String cancelText = 'Cancel',
    String confirmText = 'Remove',
    Function()? onCancle,
    Function()? onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: onCancle ?? () => Navigator.of(context).pop(),
              child: Text(cancelText),
            ),
            TextButton(onPressed: onConfirm, child: Text(confirmText)),
          ],
        );
      },
    );
  }
}
