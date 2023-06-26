

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_demo/services/supabase_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../route/route_class.dart';

class LoginController extends GetxController{

  final SupabaseServices _services= SupabaseServices();
  final formKey = GlobalKey<FormState>().obs;

  late TextEditingController emailController;
  late TextEditingController passwordController;


  login() async{
  try{
    var loginUser= await _services.signInUser(
        emailController.text,
        passwordController.text
    ).then((value){
      Get.snackbar("Congrats!!",
          "Successfully Login"
      );
       Get.toNamed(RouteClass.homePage);
    });

    print(loginUser);
  }on AuthException catch(e){
    Get.snackbar("Fail", e.message);
  }

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
   formKey.value.currentState!.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}