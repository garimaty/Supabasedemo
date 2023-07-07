
import 'dart:io';


import 'package:file_picker/file_picker.dart';

import 'package:get/get.dart';
import 'package:supabase_demo/services/supabase_services.dart';
import 'package:supabase_demo/widgets/defaultDialog.dart';

class DocumentController extends GetxController{

  final SupabaseServices _services = SupabaseServices();
  final CustomDialogs _dialog= CustomDialogs();
  FilePickerResult? result;
  File? file;
  RxList files =[].obs;



  addDocuments() async{

    result = await FilePicker.platform.pickFiles();
    if(result!=null){
      file = File(result!.files.single.path.toString());
      var fileName =result!.files.single.name;
      var filePath = result!.files.single.path;
     _dialog.alertDialogBox(
           onConfirm: () async {
             await _services.uploadFile(file, fileName,filePath);
           },
           middleText: result!.files.single.name,
         title:  'Add File', textConfirm: 'Upload File',
         textCancel: 'Cancel');
    }
  }

  fetchDocumentsList() async{
    try{
   files.value = await _services.fetchListOfFiles();

     print("${files}.----filesList");
  }catch(e){
      throw Exception(e);
  }
}

openFile(fileName){
   var bytes= _services.openFile(fileName);
   return bytes;
}

deleteFile(fileName) async {
   try{
     await _services.deleteFile(fileName).then((value){
       Get.back();
       _dialog.customSnackBar(fileName, "delete Successfully");
      // fetchDocumentsList();

     });
   }catch(e){
     throw Exception(e);
   }
}
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
     fetchDocumentsList();
  }

}