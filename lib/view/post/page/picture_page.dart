import"package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_boddy/view/common/components/button_with_icon.dart';
class PicturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
          children: [
            FloatingActionButton.extended(
              onPressed: null,
              backgroundColor: Colors.grey[200],
              icon: Icon(Icons.image),
              label: const Text('写真'),
              heroTag: "hero2",
            ),
            FloatingActionButton.extended(
              onPressed: null,
              backgroundColor: Colors.grey[200],
              icon: Icon(Icons.camera),
              label: const Text('カメラ'),
              heroTag: "hero3",
            )
          ],
        ));


  }
}
