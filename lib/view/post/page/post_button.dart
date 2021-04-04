import"package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_boddy/view/common/components/button_with_icon.dart';
class PostButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
          children: [
            FloatingActionButton.extended(
              onPressed: null,
              backgroundColor: Colors.grey[200],
              label: const Text('投稿する'),
              heroTag: "hero4",
            ),
          ],
        ));


  }
}
