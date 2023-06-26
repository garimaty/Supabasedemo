import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_demo/modules/home/controller/home_page_controller.dart';

class MyHomePage extends GetView<HomePageController>{
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

        ],
      ),
    );
  }
}


