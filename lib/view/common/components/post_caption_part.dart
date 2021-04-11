import 'dart:io';

import "package:flutter/material.dart";
import 'package:habit_boddy/component/post/enlarge_image_screen.dart';
import 'package:habit_boddy/component/post/hero_image.dart';
import 'package:habit_boddy/utils/constants.dart';
import 'package:habit_boddy/view_models/post_view_model.dart';
import 'package:provider/provider.dart';

class PostCaptionPart extends StatelessWidget {
  final PostCaptionOpenMode from;

  PostCaptionPart({@required this.from});

  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context);
    final image = Image.file(postViewModel.imageFile);
    if (from == PostCaptionOpenMode.FROM_POST) {
      final image = Image.file(postViewModel.imageFile);
      return Container(
            child: HeroImage(
          image: image,
          onTap: () => _displayLargeImage(context, image),
        ));

      //title: PostQuestionPart(),
    } else {
      return Container();
    }
  }

  _displayLargeImage(BuildContext context, Image image) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => EnlargeImageScreen(image: image),
        ));
  }
}
