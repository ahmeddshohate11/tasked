import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasked/auth/custom_text_form_field.dart';
import 'package:tasked/auth/login/login_screen.dart';
import 'package:tasked/auth/register/register_navigator.dart';
import 'package:tasked/auth/register/register_view_model.dart';
import 'package:tasked/chat/chat_screen.dart';
import 'package:tasked/utils/firebase_error.dart';
import 'package:tasked/utils/utils.dart' as utils;

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    implements RegisterNavigator {
  TextEditingController usernameController = TextEditingController(
    text: 'ahmed',
  );

  // controllre the same function onChanged & onSubmitted true
  TextEditingController emailController = TextEditingController(
    text: 'ahmed@example.com',
  );

  TextEditingController passwordController = TextEditingController(
    text: String.fromCharCode(0x2022) * 6,
  );

  TextEditingController confirmPasswordController = TextEditingController(
    text: String.fromCharCode(0x2022) * 6,
  );
  RegisterViewModel registerViewModel = RegisterViewModel();
  @override
  void initState() {
    super.initState();
    registerViewModel.registerNavigator = this;
  }

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                CustomTextFormField(
                  label: 'Username',

                  controller: usernameController,
                  validator: (text) {
                    if (text == null || text.isEmpty || text.trim().isEmpty) {
                      return 'Username is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  label: 'Email',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
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
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  label: 'Confirm Password',
                  controller: confirmPasswordController,
                  validator: (text) {
                    if (text == null || text.isEmpty || text.trim().isEmpty) {
                      return 'Confirm Password is required';
                    }
                    if (text != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      registerViewModel.registerFirebaseAuth(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                    }
                  },
                  child: Text(
                    'Go To Chat',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ), 
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                  },
                  child: Text('Already have an account? Login'),
                ),  
                // Add your registration form fields here
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// علشان لما اضغط علي زرار التسجيل يطلعلي رسالة الخطا دي  بدل ما يطلعلي رسالة الخطا دي لما اضغط علي زرار التسجيل من غير ما ادخل اي قيم في التاكسات
  void register() async {
    if (formKey.currentState?.validate() == true) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        print('User registered successfully: ${userCredential.user?.uid}');
      } on FirebaseAuthException catch (e) {
        if (e.code == FirebaseError.weakPassword) {
          print('The password provided is too weak.');
        } else if (e.code == FirebaseError.emailAlreadyInUse) {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
      // Perform registration logic
    }
    // Implement your registration logic here
  }

  @override
  void showLoading() {
    utils.showLoading(context, 'Registering...');
  }

  @override
  void hideloading() {
    utils.hideLoading(context);
  }

  @override
  void showMessage(String message) {
    utils.showMessage(context, message, 'OK', (context) {
      Navigator.pop(context);
    });
  }

  @override
  void navigateToChat() {
    Navigator.pushReplacementNamed(context, ChatScreen.routeName);
  }
}
