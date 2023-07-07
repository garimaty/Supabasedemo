import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_demo/modules/auth/binding/auth_binding.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


import 'modules/auth/view/register_screen.dart';
import 'route/route_class.dart';


Future<void> main() async {

  await Supabase.initialize(
      url: 'https://fizjwokqklyzoaezoxbf.supabase.co',
      anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZpemp3b2txa2x5em9hZXpveGJmIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODc3NjE4ODMsImV4cCI6MjAwMzMzNzg4M30.0sNFEKMkLRM-FJF_3Q8ke0XW76bTb1yP48K9KWBBaDU",
      authFlowType: AuthFlowType.pkce,
  );

   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      initialRoute: RouteClass.loginScreen,
      home: const RegisterScreen(),
      getPages: RouteClass.routes,
    );
  }
}
