
import 'package:get/get.dart';
import 'package:supabase_demo/modules/auth/controller/registerController.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(()=> RegisterController());
    // TODO: implement dependencies
  }


}