import 'dart:io';
import 'package:flutter/material.dart';
import 'package:habit_boddy/data_models/post.dart';
import 'package:habit_boddy/data_models/user.dart';
import 'package:habit_boddy/models/db/database_manager.dart';
import 'package:habit_boddy/utils/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class PostRepository {
  final DatabaseManager dbManager;

  PostRepository({this.dbManager});



  Future<File> pickedImage(UploadType uploadType) async {
    final imagePicker = ImagePicker();

    if (uploadType == UploadType.GALLERY) {
      final pickedImage =
      await imagePicker.getImage(source: ImageSource.gallery);
      return File(pickedImage.path);
    } else {
      final pickedImage =
      await imagePicker.getImage(source: ImageSource.camera);
      return File(pickedImage.path);
    }
  }
/*
  Future<void> post(
    User currentUser,
    File imageFile,
    String caption,
  ) async {
    final storageId = Uuid().v1();
    final imageUrl = await dbManager.uploadImageToStorage(imageFile, storageId);
    final post = Post(
      postId: Uuid().v1(),
      userId: currentUser.userId,
      imageUrl: imageUrl,
      imageStoragePath: storageId,
      caption: caption,
      postDateTime: DateTime.now(),
    );
    await dbManager.insertPost(post);
  }
  */


  Future<List<Post>> getPosts(FeedMode feedMode, User feedUser) async {
    if (feedMode == FeedMode.FROM_FEED) {
      //自分+フォローしているユーザーの投稿を取得
      return dbManager.getPostsMineAndFollowings(feedUser.userId);
    } else {
      //プロフィール画面に表示されているユーザーの投稿を取得
      return dbManager.getPostsByUser(feedUser.userId);
    }
  }

  post(User currentUser, String caption) {}


  /*

  Future<void> updatePost(Post updatePost) async {
    return dbManager.updatePost(updatePost);
  }

  Future<void> postComment(
      Post post, User commentUser, String commentString) async {
    final comment = Comment(
        postId: post.postId,
        comment: commentString,
        commentDateTime: DateTime.now(),
        commentUserId: commentUser.userId,
        commentId: Uuid().v1());
    await dbManager.postComment(comment);
  }

  Future<List<Comment>> getComments(String postId) async {
    return dbManager.getComments(postId);
  }

  Future<void> deleteComment(String deleteCommentId) async {
    await dbManager.deleteComment(deleteCommentId);
  }

  Future<void> likeIt(Post post, User currentUser) async {
    final like = Like(
      likeUserId: currentUser.userId,
      likeId: Uuid().v1(),
      postId: post.postId,
      likeDateTime: DateTime.now(),
    );
    await dbManager.likeIt(like);
  }

  Future<void> unLikeIt(Post post, User currentUser) async {
    await dbManager.unLikeIt(post, currentUser);
  }

  Future<LikeResult> getLikeResult(String postId, User currentUser) async {
    //いいねの取得
    final likes = await dbManager.getLikes(postId);
    //自分がその投稿にいいねしたかどうかの判定
    var isLikedPost = false;
    for (var like in likes){
      if (like.likeUserId == currentUser.userId){
        isLikedPost = true;
        break;
      }
    }
    return LikeResult(likes: likes, isLikedToThisPost: isLikedPost);
  }

  Future<void> deletePost(String postId, String imageStoragePath) async {
    await dbManager.deletePost(postId, imageStoragePath);
  }

 */

}


