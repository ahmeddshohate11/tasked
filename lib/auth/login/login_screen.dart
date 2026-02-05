import 'package:flutter/material.dart';
import 'package:tasked/auth/custom_text_form_field.dart';
import 'package:tasked/auth/register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
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
                    login();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('Login',
                      style: Theme.of(context).textTheme.titleLarge),
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
  void login(){
    // Implement your login logic here  
    if(formKey.currentState?.validate()==true){
      
      // Perform login logic
    }

}}
