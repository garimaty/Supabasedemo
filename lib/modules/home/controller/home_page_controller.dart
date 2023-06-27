
import 'package:get/get.dart';
import 'package:supabase_demo/services/supabase_services.dart';

class HomePageController extends GetxController{

  final SupabaseServices _services = SupabaseServices();
   RxList studentsList= [].obs;

   getStudentsListFromDb() async {
     try{
    studentsList.value = await _services.fetchStudentList();
      print("$studentsList - list");
      return studentsList;
     }catch(e){
       throw Exception(e);
     }

   }

   @override
  void onInit() {
    // TODO: implement onInit
    getStudentsListFromDb();
    super.onInit();
  }
}