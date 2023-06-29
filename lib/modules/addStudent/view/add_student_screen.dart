import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_demo/modules/addStudent/controller/add_student_controller.dart';


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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: controller.idController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),

                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange,width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange,width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            errorBorder:OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange,width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            hintText: "Enter Id"
                        ),
                      ),
                    )),

                 Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: controller.nameController,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),

                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange,width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange,width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          errorBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange,width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          hintText: "Enter Name"
                        ),

                      ),
                    )),

               Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: controller.phnNoController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),

                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange,width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange,width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            errorBorder:OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange,width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            hintText: "Enter Phone Number"
                        ),
                      ),
                    )),

            Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: controller.fNameController,

                        decoration: const InputDecoration(
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),

                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange,width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange,width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            errorBorder:OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange,width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            hintText: "Enter Father's Name"
                        ),
                      ),
                    )),

                 Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: controller.addressController,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),

                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange,width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange,width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            errorBorder:OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange,width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            hintText: "Enter Address"
                        ),
                      ),
                    )),
                InkWell(
                  onTap: (){
                    if(formKey.currentState!.validate()){
                      controller.addDetails();
                    }
                  },
                  child:   Container(
                    height: 50,

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.orange
                    ),
                    child: const Center(
                      child: Text("Save",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20

                        ),
                      ),
                    ),
                  ),
                ),
     ],
            ),
          ),
        ),
      ),
    );
  }
}
