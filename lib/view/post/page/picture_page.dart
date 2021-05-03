import"package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_boddy/utils/constants.dart';
import 'package:habit_boddy/view/common/components/button_with_icon.dart';
import 'package:habit_boddy/view/common/components/post_caption_part.dart';
import 'package:habit_boddy/view_models/post_view_model.dart';
import 'package:provider/provider.dart';

//投稿画面に写真を投稿するボタンをつける。
class PicturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context, listen: false);
    return SizedBox(
        child: Row(
          children: [
            FloatingActionButton.extended(
              onPressed: () {
                postViewModel.pickImage(UploadType.GALLERY);
              },
              backgroundColor: Colors.grey[200],
              icon: Icon(Icons.image),
              label: const Text('写真'),
              heroTag: "hero2",
            ),
            FloatingActionButton.extended(
              onPressed: () {
                postViewModel.pickImage(UploadType.CAMERA);
              },
              backgroundColor: Colors.grey[200],
              icon: Icon(Icons.camera),
              label: const Text('カメラ'),
              heroTag: "hero3",
            ),

          ],
        ));


  }
}
