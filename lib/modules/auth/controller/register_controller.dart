
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_demo/services/supabase_services.dart';
import 'package:supabase_demo/widgets/defaultDialog.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../route/route_class.dart';

class RegisterController extends GetxController{

late TextEditingController usernameController;
late TextEditingController emailController;
late TextEditingController passwordController;
RxBool isLoading = false.obs;

final SupabaseServices _services= SupabaseServices();
final CustomDialogs _dialogs=CustomDialogs();

//GlobalKey<FormState> registerFormKey = GlobalKey<FormState>(debugLabel: '_registerFormKey');



 register() async{
   try{
     isLoading(true);

     var user= await _services.createUser(emailController.text, passwordController.text).then((value)  {
       Get.toNamed(RouteClass.homePage);

       _dialogs.customSnackBar("Congrats!!","Successfully Registered");

     });
    await _services.createStorageForDoc();
   } on AuthException catch (e){

     _dialogs.customSnackBar("Fail!!",e.message);
   }
   // catch(e){
   //   throw Exception(e);
   // }
 }



 @override
 void onInit() {
    // TODO: implement onInit

    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

 @override
  void dispose() {

    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}