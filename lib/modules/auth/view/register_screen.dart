import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:supabase_demo/modules/auth/controller/register_controller.dart';
import 'package:supabase_demo/route/route_class.dart';
import 'package:supabase_demo/widgets/custom_button.dart';
import 'package:supabase_demo/widgets/custom_textfield.dart';


class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final formKey= GlobalKey<FormState>();
    return
       SafeArea(
         child: Scaffold(
    backgroundColor: Colors.yellow[100],
      body: SingleChildScrollView(
          child: Container(

            // decoration:  BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("assets/images/istockphoto-1218737747-612x612.jpeg"),
            //     fit: BoxFit.fill,
            //
            //   )
     //   ),
            padding: const EdgeInsets.all(15),
            child: Form(
              key:formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    const SizedBox(
                      height: 50,
                    ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset("assets/images/images.png")),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CustomTextField(
                      controller: controller.usernameController,
                      hintText: 'Enter Your Name', isObscure: false,
                    validator:  (String? value){
                      if(value!.isEmpty){
                        return "Enter your name";
                      }
                      return null;
                    },)
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CustomTextField(
                      controller: controller.emailController,
                      hintText: 'Enter Your Email',
                      isObscure: false,
                      validator: (String? value){
    if (value!.isEmpty || !RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(
    value)) {
    return "Enter valid Email";
    } else {
    return null;
    }}
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: CustomTextField(
                      controller: controller.passwordController,
                      hintText: 'Enter your password',
                      isObscure: true,
                    validator: (String? value){
                      if(value!.isEmpty){
                        return "Enter password";
                      }
                      return null;
                    },
                    )
                  ),
SizedBox(
  height: 50,
  child:   CustomButton(
      onPressed:(){
        if(formKey.currentState!.validate()){
          controller.register();
        }
      },
      content:"Create Your Account"
  ),
),

                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          const Text("If you have account then"),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () async {
                             await  Get.toNamed(RouteClass.loginScreen);
                            },
                            child: const Text("Click here",
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
       );
  }
}
