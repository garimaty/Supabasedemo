import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/document_controller.dart';

class DocumentView extends GetView<DocumentController> {
  const DocumentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.yellow[100],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          controller.addDocuments();
        },
        child:const Icon(Icons.add)
      ),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Documents"),
      ),
      body:Obx(()=> ListView.separated(
          itemCount: controller.files.length,
          itemBuilder: (context,index){
            print(controller.files.length);
            return ListTile(
              title:Text(controller.files[index]),
            );
          }, separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              thickness: 1,
              color: Colors.orange,
            );
      },
      ),)
    );
  }
}
