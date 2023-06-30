
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:supabase_demo/services/supabase_services.dart';

class DocumentController extends GetxController{

  final SupabaseServices _services = SupabaseServices();
  FilePickerResult? result;
  File? file;

  addDocuments() async{
    result = await FilePicker.platform.pickFiles();
    if(result!=null){
     file = File(result!.files.single.path.toString());
    var fileName =result!.files.single.name;
    var filePath = result!.files.single.path;
     Get.defaultDialog(
       title: 'Add File - ${result!.files.single.name}',
       textConfirm: 'Upload File',
       textCancel: 'Cancel',
       onConfirm: (){
         print(file);
         _services.uploadFile(file, fileName,filePath);
       }
     );
    }else{}
  }



}