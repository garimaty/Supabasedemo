
import 'package:get/get.dart';
import 'package:supabase_demo/modules/auth/controller/login_controller.dart';
import 'package:supabase_demo/modules/auth/controller/register_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(()=> RegisterController());
    Get.lazyPut<LoginController>(()=> LoginController());
    // TODO: implement dependencies
  }


}