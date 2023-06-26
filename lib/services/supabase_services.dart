import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


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

}