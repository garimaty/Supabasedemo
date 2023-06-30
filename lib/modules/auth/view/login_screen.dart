import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_demo/modules/auth/controller/login_controller.dart';

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
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),

                     child:    TextFormField(

                         cursorColor: Colors.orange,
                                controller: controller.emailController,
                                decoration: const InputDecoration(
                                  focusColor: Colors.yellow,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange,width: 2),
                                      borderRadius: BorderRadius.all(Radius.circular(30))
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange,width: 2),
                                      borderRadius: BorderRadius.all(Radius.circular(30))
                                  ),
                                  errorBorder:OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange,width: 2),
                                      borderRadius: BorderRadius.all(Radius.circular(30))
                                  ),
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
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
           )
             ]
                          ),

                      Padding(
                        padding: const EdgeInsets.only(top:10,bottom: 40),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                          cursorColor: Colors.orange,

                            controller: controller.passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange,width: 2),
                                  borderRadius: BorderRadius.all(Radius.circular(30))
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange,width: 2),
                                  borderRadius: BorderRadius.all(Radius.circular(30))
                              ),
                              errorBorder:OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange,width: 2),
                                  borderRadius: BorderRadius.all(Radius.circular(30))
                              ),
                              focusColor: Colors.yellow,

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
                      ),
                      InkWell(
                        onTap: (){
                          if(formKey.currentState!.validate()){
                            controller.login();
                          }
                        },
                        child:   Container(
                          height: 50,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.orange
                          ),
                          child: const Center(
                            child: Text("Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20

                              ),
                            ),
                          ),
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
