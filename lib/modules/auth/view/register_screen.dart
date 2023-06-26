import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:supabase_demo/modules/auth/controller/register_controller.dart';
import 'package:supabase_demo/route/route_class.dart';


class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: controller.registerFormKey.value,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  controller: controller.usernameController,
                  decoration: const InputDecoration(
                    focusColor: Colors.yellow,
                    border: OutlineInputBorder(),
                    hintText: "Enter Your Name",
                  ),
                  validator: (String? value){
                    if(value!.isEmpty){
                      return "Enter your name";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10,bottom: 20),
                child: TextFormField(
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
                if(controller.registerFormKey.value.currentState!.validate()){
                      controller.register();
                }
              }, child:
              const Text("Create Account"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Text("If you have account then"),
                      GestureDetector(
                        onTap: () async {
                         await  Get.toNamed(RouteClass.loginScreen);
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
    );;
  }
}
