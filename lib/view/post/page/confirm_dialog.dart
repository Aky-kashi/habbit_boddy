import "package:flutter/material.dart";

//表示させるためのメソッド
showConfirmedDialog({
  @required BuildContext context,
  @required String title,
  @required String content,
  @required ValueChanged onConfirmed,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => ConfirmDialog(
      title: title,
      content: content,
      onConfirmed: onConfirmed,
    ),
  );
}

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String content;
  final ValueChanged<bool> onConfirmed;

  ConfirmDialog({this.title, this.content, this.onConfirmed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          child: Text("はい"),
          onPressed: () {
            Navigator.pop(context);
            onConfirmed(true);
          },
        ),
        TextButton(
          child: Text("いいえ"),
          onPressed: () {
            Navigator.pop(context);
            onConfirmed(false);
          },
        )
      ],
    );
  }
}
