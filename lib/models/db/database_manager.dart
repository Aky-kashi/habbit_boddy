import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:habit_boddy/data_models/post.dart';
import 'package:habit_boddy/data_models/user.dart';

class DatabaseManager {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<bool> searchUserInDb(auth.User firebaseUser) async{
    final query = await _db.collection("users")
          .where("userId", isEqualTo: firebaseUser.uid).get();
    if (query.docs.length > 0){
      return true;
    }
    return false;
  }

  Future<void> insertUser(User user) async{
    await _db.collection("users").doc(user.userId).set(user.toMap());
  }

  Future<User> getUserInfoFromDbById(String userId) async{
    final query = await _db.collection("users").where("userId", isEqualTo: userId).get();
    return User.fromMap(query.docs[0].data());
  }

  Future<List<Post>> getPostsMineAndFollowings(String userId) async {
    //データの有無を判定
    final query = await _db.collection("posts").get();
    if (query.docs.length == 0) return List();

    var userIds = await getFollowingUserIds(userId);
    userIds.add(userId);

    var results = List<Post>();
    await _db.collection("posts").where("userId", whereIn: userIds).orderBy(
        "postDateTime", descending: true).get().then((value) {
      value.docs.forEach((element) {
        results.add(Post.fromMap(element.data()));
      });
    });
    print("posts: $results");
    return results;
  }

  Future<List<Post>> getPostsByUser(String userId) async {
    final query = await _db.collection("posts").get();
    if (query.docs.length == 0) return List();

    var results = List<Post>();
    await _db.collection("posts").where("userId", isEqualTo: userId)
        .orderBy("postDateTime", descending: true)
        .get().then((value) {
      value.docs.forEach((element) {
        results.add(Post.fromMap(element.data()));
      });
    });
    return results;
  }
  Future<List<String>> getFollowingUserIds(String userId) async {
    final query = await _db.collection("users").doc(userId).collection(
        "followings").get();
    if (query.docs.length == 0) return List();

    var userIds = List<String>();
    query.docs.forEach((id) {
      userIds.add(id.data()["userId"]);
    });
    return userIds;
  }
}