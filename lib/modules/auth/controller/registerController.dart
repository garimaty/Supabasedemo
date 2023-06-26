
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

final formKey = GlobalKey<FormState>().obs;

 register() async{

     isLoading(true);
     var user= await _services.createUser(emailController.text, passwordController.text);
     if(user.data != null){
       Get.snackbar(
         "Congrats!!",
         "You Successfully Registered and please check your mail for confirmation"
       );
     }else if(user.error?.message != null){
       Get.snackbar(
           "Fail!!",
           user.error!.message.toString()
       );
     }
    print(user);

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
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}