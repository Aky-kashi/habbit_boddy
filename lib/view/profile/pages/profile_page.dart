import"package:flutter/material.dart";
import 'package:habit_boddy/data_models/user.dart';
import 'package:habit_boddy/utils/constants.dart';
import 'package:habit_boddy/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {

  final ProfileMode profileMode;
  final User selectedUser;


  ProfilePage({@required this.profileMode, this.selectedUser});
  @override
  Widget build(BuildContext context) {
    //これがあるのは当然。理由は、書き込まれた情報をDatabaseからとってこないと行けないから。
    final profileViewModel = Provider.of<ProfileViewModel>(context, listen:false);
    //このprofileビューモデルからとってきたデータが、どのデータなのかを示すため、
    //setProfileUserを使って書いている。
    profileViewModel.setProfileUser(profileMode,selectedUser);


    Future(()=> profileViewModel.getPost());
    return Scaffold(
        body: Consumer(
          builder: (context, model, child){
            return Center(
                child: Text(model.posts.toString()));
          }
        ),
    );
  }
}
