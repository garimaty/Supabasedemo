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
    );
  }
}
