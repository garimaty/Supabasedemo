import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:supabase_demo/modules/auth/controller/register_controller.dart';
import 'package:supabase_demo/route/route_class.dart';


class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final formKey= GlobalKey<FormState>();
    return
      Scaffold(

      body: Container(
        color: Colors.yellow[100],
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

              ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset("assets/images/images.png")),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Stack(
                  children: [
                    Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: controller.usernameController,
                        decoration:  const InputDecoration(
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10,bottom: 20),
                child: Stack(
                  children: [
                    Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: TextFormField(

                          controller: controller.emailController,
                          decoration:  const InputDecoration(

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
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10,bottom: 40),
                child: Stack(
                  children: [
                    Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: TextFormField(
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
                  ],
                ),
              ),
InkWell(
  onTap: (){
    if(formKey.currentState!.validate()){
      controller.register();
    }
  },
  child:   Container(
    height: 50,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.orange
    ),
    child: const Center(
      child: Text("Create Account",
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
    );
  }
}
