import 'package:flutter/material.dart';
class DetailPost extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final maxLines = 5;

    return Container(
      margin: EdgeInsets.all(12),
      height: maxLines * 24.0,
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: "取り組む詳細を記入してください",
          fillColor: Colors.grey[300],
          filled: true,
          border: InputBorder.none,

        ),
      ),
    );
  }
}
