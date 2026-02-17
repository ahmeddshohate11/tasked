import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasked/auth/login/login_navigator.dart';
import 'package:tasked/utils/firebase_error.dart';

class LoginViewModel extends ChangeNotifier {

  late LoginNavigator loginNavigator;

  void loginFirebaseAuth(String email, String password) async {

    try {
      loginNavigator.showLoading();

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      loginNavigator.hideloading();
      loginNavigator.showMessage('Login successfully');
      loginNavigator.navigateToChat();

    } on FirebaseAuthException catch (e) {

      loginNavigator.hideloading();

      if (e.code == FirebaseError.invalidCredential) {
        loginNavigator.showMessage('Wrong email or password');
      } else {
        loginNavigator.showMessage('Login failed, try again');
      }

    } catch (e) {
      loginNavigator.hideloading();
      loginNavigator.showMessage('Something went wrong');
    }
  }
}
