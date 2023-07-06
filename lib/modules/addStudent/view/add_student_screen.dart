import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_demo/modules/addStudent/controller/add_student_controller.dart';
import 'package:supabase_demo/widgets/custom_button.dart';
import 'package:supabase_demo/widgets/custom_textfield.dart';

class AddStudent extends GetView<AddStudentController> {
  const AddStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey= GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Add Student Details"),
      ),
      body: SingleChildScrollView(
        child: Container(
           padding: const EdgeInsets.all(12),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
               Padding(
                    padding: const EdgeInsets.only(top:20,bottom: 30),
                    child: CustomTextField(
                      controller: controller.idController,
                      hintText: 'Enter Id',
                      isObscure: false,
                      textInputType: TextInputType.number,
                    )
               ),
                 Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: CustomTextField(
                      hintText: 'Enter Name',
                      controller: controller.nameController,
                      isObscure: false,
                    )
                 ),
               Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child:CustomTextField(
                      hintText: 'Enter Mobile Number',
                      controller:controller.phnNoController,
                      isObscure: false,
                    textInputType: TextInputType.number,
                    validator: (String? value){
                    if(value?.length!=10){
                      return "Enter valid Number ";
                    }
                    return null;
                    },)),
            Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: CustomTextField(
                      controller: controller.fNameController,
                      hintText: "Enter Father's Name",
                      isObscure: false,
                    )
            ),
                 Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: CustomTextField(
                      controller: controller.addressController,
                      hintText: 'Enter Address',
                      isObscure: false,
                    )
                 ),
              SizedBox(
                height: 50,
                child: CustomButton(
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        controller.addDetails();
                      }
                    },
                    content: "Save"
                ),
              )
     ],
            ),
          ),
        ),
      ),
    );
  }
}
