
import 'package:get/get.dart';
import 'package:supabase_demo/modules/auth/binding/auth_binding.dart';
import 'package:supabase_demo/modules/auth/view/login_screen.dart';
import 'package:supabase_demo/modules/auth/view/register_screen.dart';
import 'package:supabase_demo/modules/home/view/home_page.dart';

class RouteClass{
  static String registerScreen ="/register";
  static String loginScreen="/login";
  static String homePage ="/homepage";

  static List<GetPage> routes = [
    GetPage(name: RouteClass.registerScreen,
        page: ()=> const RegisterScreen(),
    binding: AuthBinding()
    ),
    GetPage(
        name: RouteClass.loginScreen,
        page: ()=> const LoginScreen(),
        binding: AuthBinding()
    ),
    GetPage(
        name: RouteClass.homePage,
        page: () => const MyHomePage()
    )
  ];
}