import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_demo/modules/documents/view/file_view.dart';
import 'package:supabase_demo/services/supabase_services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

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
      body:Obx(()=> controller.files != null? ListView.separated(
          itemCount: controller.files.length,
          itemBuilder: (context,index){

            return ListTile(
              onTap: () async {
                var file = await controller.openFile(controller.files[index]);
                List<String> data= (controller.files[index].toString()).split('.');
              print("${data[1]}----filetype");
               // print(file);
               Get.to(()=>const FileViewer(),arguments: [file,data[1]]);
              },
              title:Text(controller.files[index]),
              trailing: IconButton(
                onPressed: (){
                  print('object');
                  Get.defaultDialog(
                    backgroundColor: Colors.yellow[100],
                    title: 'Alert!!!!',
                    middleText: "Are you sure to delete this file?",
                   textConfirm: "yes",
                      textCancel: "NO",
                    cancelTextColor: Colors.orange,
                    confirmTextColor: Colors.white,
                    buttonColor: Colors.orange,
                    onConfirm: (){
                      print("delete-${controller.files[index]}");
                      controller.deleteFile(controller.files[index]);
                    }
                  );
                },
                icon: const Icon(Icons.delete),
              )
            );
          }, separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              thickness: 1,
              color: Colors.orange,
            );
      },
      ):const Center(child: Text("No Documents Present"),))
    );
  }
}
