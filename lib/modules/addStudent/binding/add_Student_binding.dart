

import 'package:get/get.dart';
import 'package:supabase_demo/modules/addStudent/controller/add_student_controller.dart';

class AddStudentBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AddStudentController>(() => AddStudentController());
  }

}