import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:habit_boddy/data_models/user.dart';
import 'package:habit_boddy/models/db/database_manager.dart';
import"package:firebase_core/firebase_core.dart";


class UserRepository {
  final DatabaseManager dbManager;

  UserRepository({this.dbManager});

  static User currentUser;

  //FirebaseAuthをつかうとき、instanceをとってくる方法がこのようにきまっているのだ。
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<bool> isSingIn() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      currentUser = await dbManager.getUserInfoFromDbById(firebaseUser.uid);


      return true;
    }
    return false;
  }

  Future<bool> signIn() async {
    try {
      GoogleSignInAccount signInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication signInAuthentication = await signInAccount
          .authentication;

      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
          idToken: signInAuthentication.idToken,
          accessToken: signInAuthentication.accessToken);
      final firebaseUser = (await _auth.signInWithCredential(credential)).user;
      if (firebaseUser == null) {
        return false;
      }
      //TODO DBに登録
      final isUserExistedInDb = await dbManager.searchUserInDb(firebaseUser);
      if (!isUserExistedInDb) {
        await dbManager.insertUser(_changetoUser(firebaseUser));
      }
      currentUser = await dbManager.getUserInfoFromDbById(firebaseUser.uid);
      return true;
    } catch (error) {
      return false;

    }
  }

  User _changetoUser(auth.User firebaseUser) {
    return User(

    userId: firebaseUser.uid,
    displayName: firebaseUser.displayName,
    inAppUserName: firebaseUser.displayName,
    photoUrl: firebaseUser.photoURL,
    email: firebaseUser.email,
    bio:"",
    );


  }


  }