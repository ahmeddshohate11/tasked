import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasked/auth/register/register_navigator.dart';
import 'package:tasked/utils/firebase_error.dart';

class RegisterViewModel extends ChangeNotifier {
  late RegisterNavigator registerNavigator;

  Future<void> registerFirebaseAuth(String email, String password) async {
    try {
      registerNavigator.showLoading();

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

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
