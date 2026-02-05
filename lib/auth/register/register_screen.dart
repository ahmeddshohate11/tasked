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
  var formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
      ),
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
                validator: (text){
                  if(text==null ||text.isEmpty || text.trim().isEmpty){
                    return 'Username is required';
                  }
                  return null;
                },  
                ),
                   SizedBox(height: 20,),
                   CustomTextFormField(
                    label: 'Email',
                   controller: emailController,
                   keyboardType: TextInputType.emailAddress,
                   validator: (text){
             if(text==null ||text.isEmpty || text.trim().isEmpty){
               return 'Email is required';
             } 
             final bool emailValid=
                RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(text );
              if(!emailValid){  
                return 'Enter a valid email address';
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
                if(text.length<6){
                  return 'Password must be at least 6 characters long';
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
              if(text!=passwordController.text){
                return 'Passwords do not match';
              } 
              return null;
            },  
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: (){    
               register();
              },
              child: 
              Text('Go to Login Screen',
              style: Theme.of(context).textTheme.titleLarge)),
            
                // Add your registration form fields here
              ],
            ),
          ),
        ),
      )
    ) ;
  }
// علشان تكون فاكر دي  ده بنعملع علشان لم اجي اي قيم في التاكسات فيل مش اضطر ادخل قيمه قيمه 
/// علشان لما اضغط علي زرار التسجيل يطلعلي رسالة الخطا دي  بدل ما يطلعلي رسالة الخطا دي لما اضغط علي زرار التسجيل من غير ما ادخل اي قيم في التاكسات
  void register(){
    if(formKey.currentState?.validate()==true){
      
      // Perform registration logic
    }
    // Implement your registration logic here
  }
}