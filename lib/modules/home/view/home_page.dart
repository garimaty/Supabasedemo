import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_demo/modules/home/controller/home_page_controller.dart';

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

         child:  Obx(()=> ListView.builder(
           itemCount: controller.studentsList.length,
           itemBuilder: (BuildContext context, int index) {
             print(controller.studentsList.length);
             return Text("${controller.studentsList[index]}");
           },
         ))
      )
    );
  }
}


