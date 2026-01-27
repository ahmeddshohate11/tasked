import 'package:flutter/material.dart';
import 'package:tasked/app_colors.dart';

typedef ValidatorFunction = String? Function(String? value);
class CustomTextFormField extends StatelessWidget {

 const CustomTextFormField({super.key,required this.label,required this.validator,required this.controller, this.keyboardType=TextInputType.text, this.obscureText=false});
 final String label;
 final ValidatorFunction validator;
 final TextEditingController controller;
final TextInputType keyboardType;
final bool obscureText;
// const String email = "tony@starkindustries.com";

// final bool emailValid = 
//     RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//       .hasMatch(email);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor,
            width: 2.0),
            borderRadius: BorderRadius.circular(15.0),
             
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor,
            width: 2.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red,
            width: 2.0),
            borderRadius: BorderRadius.circular(15.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red,
            width: 2.0),
            borderRadius: BorderRadius.circular(15.0),
            ),
          labelText: label,
        ),
       validator: validator,
       controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
      ),
    );
  }
}