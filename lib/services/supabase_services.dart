import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class SupabaseServices{
  final supabase = Supabase.instance.client;

  createUser(email,password) async {
    try{
      final AuthResponse res = await supabase.auth.signUp(
          email: email,
          password: password
      );
    }catch(e){
      throw Exception(e);
    }
  }

}