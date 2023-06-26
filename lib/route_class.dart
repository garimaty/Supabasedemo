
import 'package:get/get.dart';
import 'package:supabase_demo/modules/auth/binding/auth_binding.dart';
import 'package:supabase_demo/modules/auth/view/register_screen.dart';

class RouteClass{
  static String registerScreen ="register";

  static List<GetPage> routes = [
    GetPage(name: RouteClass.registerScreen,
        page: ()=> const RegisterScreen(),
    binding: AuthBinding()
    )
  ];
}