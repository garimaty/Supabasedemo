
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_demo/services/supabase_services.dart';

class DocumentController extends GetxController{

  final SupabaseServices _services = SupabaseServices();
  FilePickerResult? result;
  File? file;
  RxList files =[].obs;

  addDocuments() async{

    result = await FilePicker.platform.pickFiles();
    if(result!=null){
      file = File(result!.files.single.path.toString());
      var fileName =result!.files.single.name;
      var filePath = result!.files.single.path;
      Get.defaultDialog(
          backgroundColor: Colors.yellow[100],
          middleText: result!.files.single.name,
          buttonColor: Colors.orange,
          cancelTextColor: Colors.orange,
          confirmTextColor: Colors.white,
          title: 'Add File ',
          textConfirm: 'Upload File',
          textCancel: 'Cancel',
          onConfirm: () async {
            print(file);
            _services.uploadFile(file, fileName,filePath);

          }
      );
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



@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
     fetchDocumentsList();
  }

}