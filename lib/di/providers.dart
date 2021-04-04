import "package:flutter/material.dart";
import 'package:habit_boddy/models/db/database_manager.dart';
import 'package:habit_boddy/models/repositories/post_repository.dart';
import 'package:habit_boddy/models/repositories/user_repository.dart';
import 'package:habit_boddy/view/post/page/post_page.dart';
import 'package:habit_boddy/view_models/login_view_model.dart';
import 'package:habit_boddy/view_models/post_view_model.dart';
import 'package:habit_boddy/view_models/profile_view_model.dart';
import "package:provider/provider.dart";
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

List<SingleChildWidget> independentModels = [
  Provider<DatabaseManager>(
    create: (context) => DatabaseManager(),
  ),
];

List<SingleChildWidget> dependentModels = [
  ProxyProvider<DatabaseManager, UserRepository>(
    update: (context, dbManager, repo) => UserRepository(dbManager: dbManager),
  ),
  ProxyProvider<DatabaseManager, PostRepository>(
    update: (context, dbManager, repo) => PostRepository(dbManager: dbManager),
  ),
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<LoginViewModel>(
    create: (context) => LoginViewModel(
        userRepository: Provider.of<UserRepository>(context, listen: false)),
  ),
  ChangeNotifierProvider<PostViewModel>(
    create: (context) => PostViewModel(
        userRepository: Provider.of<UserRepository>(context, listen: false),
        postRepository: Provider.of<PostRepository>(context, listen: false),),
  ),
  ChangeNotifierProvider<ProfileViewModel>(
    create: (context) => ProfileViewModel(
        userRepository: Provider.of<UserRepository>(context, listen: false),
    ),
  )

];


