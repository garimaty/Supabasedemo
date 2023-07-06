

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_demo/services/supabase_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../route/route_class.dart';

class LoginController extends GetxController{

  final SupabaseServices _services= SupabaseServices();
//  GlobalKey<FormState> formKey = GlobalKey<FormState>(debugLabel: '_loginFormKey');

  late TextEditingController emailController;
  late TextEditingController passwordController;
   final RxString uid= ''.obs;

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
  }}


  signInWithGoogle() async {
    try{
      await _services.signInUsingGoogle();
    }catch(e){
      throw Exception(e);
    }
  }

  @override
  void onInit() {

    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {

    emailController.dispose();
    passwordController.dispose();
   super.dispose();
  }
}