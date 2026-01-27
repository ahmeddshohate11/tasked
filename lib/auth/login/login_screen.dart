import 'package:flutter/material.dart';
import 'package:tasked/auth/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
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
        child: Column(
          children: [
            Text('Login Screen'),
            CustomTextFormField(
              label: 'Email',
              controller: emailController,
              validator: (text){
                if(text==null ||text.isEmpty || text.trim().isEmpty){
                  return 'Email is required';
                }
                return null;
              },
              
            ),
            SizedBox(height: 20,),
            CustomTextFormField(
              label: 'Password',
              controller: passwordController,
              validator: (text){
                if(text==null ||text.isEmpty || text.trim().isEmpty){
                  return 'Password is required';
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/register');
              }, 
              child: Text('Go to Register Screen'))
          ],
        )
      ),
    ) ;
  }
}