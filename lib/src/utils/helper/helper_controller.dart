import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helper extends GetxController{
  static successSnackBar({required title,message}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 6),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.check_circle,color: Colors.white,)
    );
  }
  static warningSnackBar({required title,message}){
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 6),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Icons.warning_rounded,color: Colors.red,)
    );
  }
  static errorSnackBar({required title,message}){
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 6),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Icons.cancel,color: Colors.white,)
    );
  }
}