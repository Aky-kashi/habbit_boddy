import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:habit_boddy/view/home_screen.dart';
import 'package:habit_boddy/view_models/login_view_model.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Consumer<LoginViewModel>(
          builder: (context, model, child){
            return model.isLoading
            ? CircularProgressIndicator() :Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HabitBoddy!',
                  style: TextStyle(
                      fontSize: 40,
                      foreground: Paint()
                        ..shader = ui.Gradient.linear(
                          const Offset(0, 20),
                          const Offset(150, 20),
                          <Color>[
                            Colors.red,
                            Colors.yellow,
                          ],
                        )
                  ),
                ),
                SignInButton(
                  Buttons.Google,
                  text: "Sign up with Google",
                  onPressed: () => login(context),
                )


              ],

            );

          },

        ),
      ),
    );
  }

  login(BuildContext context) async{
    final loginViewModel = Provider.of<LoginViewModel>(context,listen:false);
    await loginViewModel.sighIn();
    if (!loginViewModel.isSuccessful){
      Fluttertoast.showToast(msg: "signInFailed");
      return;
    }
    _openHomeScreen(context);

  }

  void _openHomeScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
        builder:(_) => HomeScreen()));
  }
}
