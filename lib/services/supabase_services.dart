import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../modules/home/model/student_model.dart';


class SupabaseServices{
  final supabase = Supabase.instance.client;

  createUser(email,password) async {

      final AuthResponse res = await supabase.auth.signUp(
          email: email,
          password: password
      );
      return res;

  }

  signInUser(email,password) async {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password
    );
    return res;
  }

  //insert data into database
  insertData(id,name,phnNo,fName,add) async{
    final User? user = supabase.auth.currentUser;
    await supabase.from("students").insert(
      {
        'id':id,
         'name':name,
        'Phone_number':phnNo,
        "Father's_Name": fName,
        'Address': add,
        'teacherUid': user?.id,
      }
    );
  }

 fetchStudentList() async{
   final data= await supabase.from('students').select('*');
   print("$data----");
   final list = json.decode(json.encode(data));
   print("$list lll");

   var response = list.map((e) => Student.fromJson(e)).toList();
   print("{$response rrrr}");
   return response;

  }

}
