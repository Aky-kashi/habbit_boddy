import 'package:flutter/material.dart';
class DetailPost extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final maxLines = 10;

    return Container(
      margin: EdgeInsets.all(12),
      height: maxLines * 24.0,
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: "詳細を記入してください",
          fillColor: Colors.grey[200],
          filled: true,
          border: InputBorder.none,

        ),
      ),
    );
  }
}
