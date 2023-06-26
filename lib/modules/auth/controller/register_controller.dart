
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_demo/services/supabase_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterController extends GetxController{

late TextEditingController usernameController;
late TextEditingController emailController;
late TextEditingController passwordController;
RxBool isLoading = false.obs;

final SupabaseServices _services= SupabaseServices();

final registerFormKey = GlobalKey<FormState>().obs;

 register() async{
   try{
     isLoading(true);
     var user= await _services.createUser(emailController.text, passwordController.text);
     Get.snackbar("Congrats!!","Successfully Registered");
   } on AuthException catch (e){
     Get.snackbar(
         "Fail!!",
         e.message
     );
   }
   // catch(e){
   //   throw Exception(e);
   // }
 }

 @override
 void onInit() {
    // TODO: implement onInit
    super.onInit();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();

  }

 @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    registerFormKey.value.currentState!.dispose();
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}