import 'dart:io';

import"package:flutter/material.dart";
import 'package:habit_boddy/models/repositories/post_repository.dart';
import 'package:habit_boddy/models/repositories/user_repository.dart';


class PostViewModel extends ChangeNotifier{
  final UserRepository userRepository;
  final PostRepository postRepository;
  PostViewModel({this.userRepository, this.postRepository});

  File imageFile;
  bool isProcessing = false;
  bool isImagePicked = false;
  String caption = "";
  //TODO
  Future<void> post() async{
    isProcessing = true;
    notifyListeners();

    await postRepository.post(
      UserRepository.currentUser,
      caption,
    );
    isProcessing = false;
    notifyListeners();

  }

  Future <void> pickImage(uploadType) async{
    isImagePicked = false;
    isProcessing = true;
    notifyListeners();

    imageFile = await postRepository.pickedImage(uploadType);
    print("pickedImage: ${imageFile.path}");

    if (imageFile != null) isImagePicked = true;
    isProcessing = false;
    notifyListeners();

  }


}