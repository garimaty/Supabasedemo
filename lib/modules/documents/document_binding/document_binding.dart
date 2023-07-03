
import 'package:get/get.dart';
import 'package:supabase_demo/modules/documents/controller/document_controller.dart';

class DocumentsBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DocumentController>(() => DocumentController());
  }

}