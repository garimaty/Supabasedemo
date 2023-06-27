import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_demo/modules/addStudent/controller/add_student_controller.dart';


class AddStudent extends GetView<AddStudentController> {
  const AddStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Student Details"),
      ),
      body: SingleChildScrollView(
        child: Container(
           padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Text("Roll Number",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
             Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: TextField(
                    controller: controller.idController,
                    keyboardType: TextInputType.number,
                  )),
              const Text("Name",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
               Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: TextField(
                    controller: controller.nameController,
                  )),
              const Text("Phone Number",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),
             Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: TextField(
                    controller: controller.phnNoController,
                    keyboardType: TextInputType.number,

                  )),
              const Text("Father's Name",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),
          Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: TextField(
                    controller: controller.fNameController,
                  )),
              const Text("Address",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),
               Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: TextField(
                    controller: controller.addressController,
                  )),
Center(
  child:   ElevatedButton(
        onPressed: (){
          controller.addDetails();
        },
        child: const Text("Save")),
)
            ],
          ),
        ),
      ),
    );
  }
}
