import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_demo/modules/auth/controller/login_controller.dart';
import 'package:supabase_demo/widgets/custom_button.dart';
import 'package:supabase_demo/widgets/custom_textfield.dart';

import '../../../route/route_class.dart';


class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
   final formKey= GlobalKey<FormState>();
    return SafeArea(
       child: Scaffold(
        backgroundColor: Colors.yellow[100],
         body: SingleChildScrollView(
           child: Container(
             padding: const EdgeInsets.all(10),
             child: Form(
               key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top:100,bottom: 20),
                  child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       ClipRRect(
                         borderRadius: BorderRadius.circular(100),
                           child: Image.asset("assets/images/images.png")),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10,bottom: 10),
                        child: CustomTextField(
                          controller: controller.emailController,
                          hintText: 'Enter Your Email',
                          isObscure: false,
                          validator: (String? value) {
                            if (value!.isEmpty || !RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(
                                  value)) {
                                return "Enter valid Email";
                              } else {
                                return null;
                              }
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:10,bottom: 30),
                        child: CustomTextField(
                          controller: controller.passwordController,
                          hintText: 'Enter Your PassWord',
                          isObscure: true,
                          validator: (String? value){
                            if(value!.isEmpty){
                              return "Enter password";
                            }
                            return null;
                          }
                        )
                      ),
                    SizedBox(
                      height: 50,
                      child: CustomButton(
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              controller.login();
                            }
                          } ,
                          content: "Login"
                      ),
                    ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              const Text("If you not don't have account then"),
                              GestureDetector(
                                onTap: (){
                             Get.toNamed(RouteClass.registerScreen);
                                },
                                child: const Text("Create one",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.orange
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
       ),
    );
  }
}
