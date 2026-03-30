import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasked/auth/login/login_navigator.dart';
import 'package:tasked/utils/data_base_utils.dart';
import 'package:tasked/utils/firebase_error.dart';

class LoginViewModel extends ChangeNotifier {

  late LoginNavigator loginNavigator;

  void loginFirebaseAuth(String email, String password) async {

    try {
      loginNavigator.showLoading();

  final result =    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
     var userObj = await DataBaseUtils.getUserCollection(
        result.user!.uid, 
      );
      if(userObj == null){
        loginNavigator.hideloading();
        loginNavigator.showMessage('User not found');
       
      }
      else{
        loginNavigator.hideloading();
        loginNavigator.showMessage('Login successfully');
        loginNavigator.navigateToChat();
      } 

      loginNavigator.hideloading();
      loginNavigator.showMessage('Login successfully');
      loginNavigator.navigateToChat(
        
      );

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
