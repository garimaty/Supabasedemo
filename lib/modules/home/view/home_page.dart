import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_demo/modules/home/controller/home_page_controller.dart';
import 'package:supabase_demo/modules/home/model/student_model.dart';

import '../../../route/route_class.dart';

class MyHomePage extends GetView<HomePageController>{
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:  FloatingActionButton(
        onPressed: () {
           Get.toNamed(RouteClass.addStudentDetail);
        },
         child: const Icon(Icons.add)
    ),
      appBar: AppBar(
        title: const Text("Students Data"),
      ),
      body:
      Container(
           padding: const EdgeInsets.all(12),

         child:
         FutureBuilder<List<Student>>(
           future: controller.getStudentsListFromDb(),
           builder: (context, snapshot) {
             print(snapshot.data);
             if (snapshot.connectionState == ConnectionState.waiting) {
               return const Center(
                   child: CircularProgressIndicator()
               );
           }
             if(snapshot.hasData && snapshot.data != null){
               var data = snapshot.data as List<Student>;
               return ListView.builder(
                 itemCount: data?.length,
                   itemBuilder: (context,index){
                   var name = data![index].name;
                   print("{$name nameeeee}");
                   return Text("$name");
                   });
             }
             else{
               return const Text("no data present");
             }
           },
         )
 // //   Obx(()=>
 //             ListView.builder(
 //         //  itemCount: controller.studentsList.value.,
 //           itemBuilder: (BuildContext context, int index) {
 //
 //             return Text("${controller.studentsList.value.name}");
 //           },
 //         )
      //   )
      )
    );
  }
}


