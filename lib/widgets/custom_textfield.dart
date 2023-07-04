import 'package:flutter/material.dart';



class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key,
    required this.controller,
    required this.hintText,
    required this.isObscure,
    this.textInputType,
    this.validator

  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;
  final TextInputType? textInputType;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
    child:  TextFormField(
        cursorColor: Colors.orange,
keyboardType: textInputType,
        controller: controller,
        obscureText: isObscure,
        decoration:  InputDecoration(
          hintStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          errorBorder:const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          focusColor: Colors.yellow,

          hintText: hintText,
        ),
        validator: validator
          //   (String? value){
          // if(value!.isEmpty){
          //   return "Enter password";
          // }
          // return null;
       // },
      ),
    );
  }
}
