

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_demo/modules/home/controller/home_page_controller.dart';
import 'package:supabase_demo/services/supabase_services.dart';

class AddStudentController extends GetxController{
late TextEditingController nameController;
late TextEditingController phnNoController;
late TextEditingController fNameController;
late TextEditingController addressController;
late TextEditingController idController;
final SupabaseServices _services = SupabaseServices();

addDetails() async{
  try{
    await _services.insertData(
        idController.text, 
        nameController.text, 
        phnNoController.text,
        fNameController.text,
        addressController.text
    ).then((value){

      Get.back();
     Get.find<HomePageController>().getStudentsListFromDb();
      Get.snackbar("Congrats!!", "Student add successfully");

    });
  }catch(e){
    throw Exception(e);
  }
}

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController=TextEditingController();
    phnNoController=TextEditingController();
    fNameController=TextEditingController();
    addressController=TextEditingController();
    idController=TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    phnNoController.dispose();
    fNameController.dispose();
    addressController.dispose();
    idController.dispose();
  }
}