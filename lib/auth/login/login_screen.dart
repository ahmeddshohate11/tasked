import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasked/auth/custom_text_form_field.dart';
import 'package:tasked/auth/login/login_navigator.dart';
import 'package:tasked/auth/login/login_view_model.dart';
import 'package:tasked/auth/register/register_screen.dart';
import 'package:tasked/chat/chat_screen.dart';
import 'package:tasked/utils/utils.dart' as utils;

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNavigator {
  TextEditingController emailController = TextEditingController(
    text: 'ahmed@example.com',
  );

  TextEditingController passwordController = TextEditingController(
    text: String.fromCharCode(0x2022) * 6,
  );

  var formKey = GlobalKey<FormState>();
  LoginViewModel loginViewModel = LoginViewModel();
  void initState() {
    super.initState();
    loginViewModel.loginNavigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text('Login Screen'),
              CustomTextFormField(
                label: 'Email',
                controller: emailController,
                validator: (text) {
                  if (text == null || text.isEmpty || text.trim().isEmpty) {
                    return 'Email is required';
                  }
                  final bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(text);
                  if (!emailValid) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                label: 'Password',
                controller: passwordController,
                validator: (text) {
                  if (text == null || text.isEmpty || text.trim().isEmpty) {
                    return 'Password is required';
                  }
                  if (text.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: ElevatedButton(
                  onPressed: () {
                    loginViewModel.loginFirebaseAuth(
                      emailController.text,
                      passwordController.text,
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegisterScreen.routeName);
                },
                child: Text(
                  'OR Create an account',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    
  }
  
  @override
  void hideloading() {
    utils.hideLoading(context);
  }
  
  @override
  void navigateToChat() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, ChatScreen.routeName);
    }); 
  }
  
  @override
  void showLoading() {
    utils.showLoading(context, 'Logging in...');
  }
  
  @override
  void showMessage(String message) {
    utils.showMessage(context, message, 'OK', (context) {
      Navigator.pop(context);
    });
  }

  // void login() {
  //   // Implement your login logic here
  //   if (formKey.currentState?.validate() == true) {
  //     loginViewModel.loginFirebaseAuth(
  //     emailController.text,
  //     passwordController.text,
  //     );

  //   }
  // }

}