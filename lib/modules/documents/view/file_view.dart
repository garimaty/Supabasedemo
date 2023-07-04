import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FileViewer extends StatelessWidget {
  const FileViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var file = Get.arguments;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
            child: file[1] == "pdf"?
            SfPdfViewer.memory(file[0]):file[1]=="jpg"||file[1]=="png"||file[1]=='jpeg'?
            Image.memory(file[0]):
            const Center(child: Text("Cannot show this type of file"),)
      )
      ),
    );
  }
}
