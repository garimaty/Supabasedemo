
import 'package:get/get.dart';
import 'package:supabase_demo/modules/home/model/student_model.dart';
import 'package:supabase_demo/services/supabase_services.dart';

class HomePageController extends GetxController{

  final SupabaseServices _services = SupabaseServices();
   //final Rx<Student> studentsList = Student().obs;
  RxList getData= [].obs;

 getStudentsListFromDb() async {
     //try{
      var studentsList = await _services.fetchStudentList();

     // print("$studentsList - list");
      getData.value = studentsList;
      //getData.add(studentsList);
       return studentsList;
      // getData.add(studentsList);
      // print(getData);
      // return getData;
    // }
     // catch(e){
     //
     //   throw Exception(e);
     // }

   }

   @override
  void onInit() {
    // TODO: implement onInit
    getStudentsListFromDb();
    super.onInit();
  }
}