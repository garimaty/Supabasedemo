
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialogs{

  alertDialogBox(
      {required Function() onConfirm,required String middleText,
        required String title,required String textConfirm, required String textCancel}) {
   return Get.defaultDialog(
        backgroundColor: Colors.yellow[100],
        middleText: middleText,
        buttonColor: Colors.orange,
        cancelTextColor: Colors.orange,
        confirmTextColor: Colors.white,
        title: title,
        textConfirm: textConfirm,
        textCancel: textCancel,
        onConfirm: onConfirm
    );
  }
}