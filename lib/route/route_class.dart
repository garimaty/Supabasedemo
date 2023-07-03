
import 'package:get/get.dart';
import 'package:supabase_demo/modules/addStudent/binding/add_Student_binding.dart';
import 'package:supabase_demo/modules/addStudent/view/add_student_screen.dart';
import 'package:supabase_demo/modules/auth/binding/auth_binding.dart';
import 'package:supabase_demo/modules/auth/view/login_screen.dart';
import 'package:supabase_demo/modules/auth/view/register_screen.dart';
import 'package:supabase_demo/modules/documents/document_binding/document_binding.dart';
import 'package:supabase_demo/modules/documents/view/document_list_view.dart';
import 'package:supabase_demo/modules/home/binding/homeBinding.dart';
import 'package:supabase_demo/modules/home/view/home_page.dart';

class RouteClass{
  static String registerScreen ="/register";
  static String loginScreen="/login";
  static String homePage ="/homepage";
  static String addStudentDetail="/addStudentDetail";
  static String documentScreen='/documentScreen';

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
      binding: HomeBinding(),
        name: RouteClass.homePage,
        page: () => const MyHomePage()
    ),
    GetPage(
      binding: AddStudentBinding(),
        name: RouteClass.addStudentDetail,
        page:() => const AddStudent()
    ),
    GetPage(
        name: RouteClass.documentScreen,
        page: ()=> const DocumentView(),
        binding: DocumentsBinding()
    )
  ];
}