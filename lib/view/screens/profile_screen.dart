import 'package:flutter/material.dart';
import 'package:habit_boddy/data_models/user.dart';
import 'package:habit_boddy/utils/constants.dart';
import 'package:habit_boddy/view/profile/pages/profile_page.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileMode profileMode;
  final User selectedUser;


  ProfileScreen({this.profileMode, this.selectedUser});
  @override
  Widget build(BuildContext context) {
    return ProfilePage(
      profileMode: profileMode,selectedUser: selectedUser
    );
  }
}
