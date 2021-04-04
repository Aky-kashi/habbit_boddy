import 'package:flutter/cupertino.dart';
import 'package:habit_boddy/data_models/post.dart';
import 'package:habit_boddy/data_models/user.dart';
import 'package:habit_boddy/models/repositories/post_repository.dart';
import 'package:habit_boddy/models/repositories/user_repository.dart';
import 'package:habit_boddy/utils/constants.dart';

class ProfileViewModel extends ChangeNotifier{
  final UserRepository userRepository;
  final PostRepository postRepository;
  ProfileViewModel({this.userRepository, this.postRepository});

  //プロフィールに表示するUserは誰？（他人）

  User profileUser;

  //今現在のUserをこのやり方でとってくる。（自分）
  User get currentUser => UserRepository.currentUser;

  bool isProcessing = false;

  List<Post> posts = List();

  //プロフィール画面はどのユーザーなのかを場合わけする。

  void setProfileUser(ProfileMode profileMode,User selectedUser) {
    if(profileMode == ProfileMode.MYSELF){
      profileUser = currentUser;
    } else {
      profileUser = selectedUser;
    }
  }

  Future <void> getPost() async{
    isProcessing = true;
    notifyListeners();

    posts = await postRepository.getPosts(FeedMode.FROM_PROFILE, profileUser);

    isProcessing = false;
    notifyListeners();

    posts = await postRepository.getPosts(FeedMode.FROM_PROFILE,profileUser);
    isProcessing = false;
    notifyListeners();
  }

}