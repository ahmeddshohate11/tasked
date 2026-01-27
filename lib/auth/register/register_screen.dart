import 'package:flutter/material.dart';
import 'package:tasked/auth/custom_text_form_field.dart';
import 'package:tasked/auth/login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = '/register';
  TextEditingController usernameController=TextEditingController();
  // controllre the same function onChanged & onSubmitted true 
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              CustomTextFormField(
                label: 'Username',
                
              controller: usernameController,
              validator: (text){
                if(text==null ||text.isEmpty || text.trim().isEmpty){
                  return 'Username is required';
                }
                return null;
              },  
              ),
                 SizedBox(height: 20,),
                 CustomTextFormField(label: 'Email',
                 controller: emailController,
                 validator: (text){
           if(text==null ||text.isEmpty || text.trim().isEmpty){
             return 'Email is required';
           }
           return null;
                 },  
                 ),
                 SizedBox(height: 20,),
          CustomTextFormField(label: 'Password',
          controller: passwordController,
          validator: (text){
            if(text==null ||text.isEmpty || text.trim().isEmpty){
              return 'Password is required';
            }
            return null;
          },  
          ),
          SizedBox(height: 20,),
          CustomTextFormField(label: 'Confirm Password',
          controller: confirmPasswordController,
          validator: (text){
            if(text==null ||text.isEmpty || text.trim().isEmpty){
              return 'Confirm Password is required';
            }
            return null;
          },  
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: (){    
              Navigator.pushNamed(context,LoginScreen.routeName);
            },
            child: Text('Go to Login Screen')),
          
              // Add your registration form fields here
            ],
          ),
        ),
      )
    ) ;
  }
}