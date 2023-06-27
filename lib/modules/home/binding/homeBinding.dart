

import 'package:get/get.dart';
import 'package:supabase_demo/modules/home/controller/home_page_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomePageController>(() => HomePageController());
  }

}