import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_demo/modules/auth/controller/login_controller.dart';

import '../../../route/route_class.dart';


class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: controller.formKey.value,
             child: Padding(
               padding: const EdgeInsets.only(bottom: 20),
               child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   TextFormField(
                       controller: controller.emailController,
                       decoration: const InputDecoration(
                         focusColor: Colors.yellow,
                         border: OutlineInputBorder(),
                         hintText: "Enter your Email Id",
                       ),
                       validator: (String? value){
                         if (value!.isEmpty || !RegExp(
                             r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(
                             value)) {
                           return "Enter valid Email";
                         } else {
                           return null;
                         }
                       }
                   ),
                   Padding(
                     padding: const EdgeInsets.only(top:10,bottom: 20),
                     child: TextFormField(
                       controller: controller.passwordController,
                       obscureText: true,
                       decoration: const InputDecoration(
                         focusColor: Colors.yellow,
                         border: OutlineInputBorder(),
                         hintText: "Enter Your Password",
                       ),
                       validator: (String? value){
                         if(value!.isEmpty){
                           return "Enter password";
                         }
                         return null;
                       },
                     ),
                   ),

                   ElevatedButton(onPressed: (){
                     if(controller.formKey.value.currentState!.validate()){
                       controller.login();
                     }
                   }, child:
                   const Text("Login"),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(top: 10),
                     child: Center(
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children:  [
                           const Text("If you not have account then create one.."),
                           GestureDetector(
                             onTap: (){

                             },
                             child: const Text("CLICK HERE",
                               style: TextStyle(
                                   decoration: TextDecoration.underline,
                                   color: Colors.blue
                               ),
                             ),
                           )
                         ],
                       ),
                     ),
                   )
                 ],
               ),
             ),
          ),
        ),
      ),
    );
  }
}
