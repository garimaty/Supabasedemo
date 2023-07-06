
import 'package:get/get.dart';
import 'package:supabase_demo/modules/home/model/student_model.dart';
import 'package:supabase_demo/services/supabase_services.dart';

import '../../../route/route_class.dart';

class HomePageController extends GetxController{

  final SupabaseServices _services = SupabaseServices();
   //final Rx<Student> studentsList = Student().obs;
  RxList getData= [].obs;
  RxList searchDataList=[].obs;
  var user = ''.obs;

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

  searchData(query) async{
   try{
  var list = await _services.searchQuery(query);
  searchDataList.value= list;

    print("${list}--searchData");


   }catch(e){
     throw Exception(e);
   }
   }

   logOut() async {
  await _services.logout().then((value){
     Get.offAllNamed(RouteClass.loginScreen);
  });
   }


   @override
  void onInit() {
    // TODO: implement onInit
    getStudentsListFromDb();

    user.value = _services.currentUser?.email??'0';
    print(_services.currentUser);
    super.onInit();
  }
}