import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_demo/modules/documents/controller/document_controller.dart';
import 'package:supabase_demo/modules/home/controller/home_page_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../modules/home/model/student_model.dart';


class SupabaseServices {
  final supabase = Supabase.instance.client;
  final User? currentUser = Supabase.instance.client.auth.currentUser;

  createUser(email, password) async {
    final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: password
    );
    return res;
  }

  signInUser(email, password) async {
    final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password
    );
    return res;
  }

  //insert data into database
  insertData(id, name, phnNo, fName, add) async {
    final User? user = supabase.auth.currentUser;
    await supabase.from("students").insert(
        {
          'id': id,
          'name': name,
          'Phone_number': phnNo,
          "Father's_Name": fName,
          'Address': add,
          'teacherUid': user?.id,
        }
    );
  }


  fetchStudentList() async {
    final User? user = supabase.auth.currentUser;
    final data = await supabase.from('students').select('*').eq(
        'teacherUid', user?.id);
    print("$data----");
    final list = json.decode(json.encode(data));
    print("$list lll");

    var response = list.map((e) => Student.fromJson(e)).toList();
    print("{$response rrrr}");
    return response;
  }

  createStorageForDoc() async {
    final User? user = supabase.auth.currentUser;
    print("${user?.id}--");
    final String result = await supabase.storage.createBucket("${user?.id}");
  }

  uploadFile(file, fileName, filePath) async {
    final User? user = supabase.auth.currentUser;
    try {
      //   final String result = await supabase.storage.emptyBucket("public-documents");
      print("${user?.id} - iddddd");
      final String path = await supabase.storage.from('${user?.id}').upload(
          fileName,
          file,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false)
      ).then((value) {
        Get.back();
        Get.snackbar("Congrats!", "Upload Successfully");
        return Get.find<DocumentController>().fetchDocumentsList();

      });


      print(path);
    } on StorageException catch (e)  {
      Get.back();
        Get.snackbar("Fail!", e.message);
      print(e.message);
    }
  }

  fetchListOfFiles() async{

      final User? user = supabase.auth.currentUser;
    List list=[];
      final List<FileObject> objects = await supabase.storage.from("${user?.id}").list();
      objects.forEach((element) async {
        print(element.name);
          // final Uint8List result = await supabase.storage.from("${user?.id}").download(element.name);
           list.add(element.name);
         // print(result);
        });
      return list;
  }

  logout() async{
    await supabase.auth.signOut();
  }

}




