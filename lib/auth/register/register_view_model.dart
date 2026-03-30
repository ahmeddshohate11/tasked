import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasked/auth/register/register_navigator.dart';
import 'package:tasked/model/user.dart';
import 'package:tasked/utils/data_base_utils.dart';
import 'package:tasked/utils/firebase_error.dart';

class RegisterViewModel extends ChangeNotifier {
  late RegisterNavigator registerNavigator;

  Future<void> registerFirebaseAuth(
    String email,
    String password,
    String userName,
    String firstName,
    String lastName,

  ) async {
    try {
      registerNavigator.showLoading();

      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      /// save user data in firestore
    var user = MyUser(
      id: result.user?.uid ?? '', firstName: firstName,
       lastName: lastName, userName: userName, email: email);

     var dataUSer = await DataBaseUtils.addMyUseregisterUSer(user);

      registerNavigator.hideloading();
      registerNavigator.showMessage('User registered successfully');
      registerNavigator.navigateToChat();
    } on FirebaseAuthException catch (e) {
      registerNavigator.hideloading();

      if (e.code == FirebaseError.emailAlreadyInUse) {
        registerNavigator.showMessage('Email already exists');
      } else if (e.code == FirebaseError.weakPassword) {
        registerNavigator.showMessage('Password must be at least 6 characters');
      } else if (e.code == FirebaseError.invalidEmail) {
        registerNavigator.showMessage('Invalid email format');
      } else {
        registerNavigator.showMessage(e.message ?? 'Registration failed');
      }
    } catch (e) {
      registerNavigator.hideloading();
      registerNavigator.showMessage('Something went wrong');
    }
  }
}
