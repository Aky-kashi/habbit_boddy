import 'package:flutter/material.dart';
import 'package:habit_boddy/models/repositories/user_repository.dart';

class PostViewModel extends ChangeNotifier {
  final UserRepository userRepository;


  PostViewModel({this.userRepository});

  String caption = "";


}