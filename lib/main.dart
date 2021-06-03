import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habit_boddy/view/home_screen.dart';
import 'package:habit_boddy/view/screens/login_screen.dart';
import 'package:habit_boddy/view_models/login_view_model.dart';
import 'package:provider/provider.dart';
import 'di/providers.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
      MultiProvider(
        providers: globalProviders,
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    return MaterialApp(
      title: "HabitBoddy",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: FutureBuilder(
        future: loginViewModel.isSingIn(),
        builder: (context, AsyncSnapshot<bool> snapshot){
          if (snapshot.hasData && snapshot.data){
            return HomeScreen();
          } else {
            //return LoginScreen();
            return HomeScreen();
          }
        },
      ),
    );
  }
}
