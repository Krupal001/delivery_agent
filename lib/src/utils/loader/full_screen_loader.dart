import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'animation_loader_widget.dart';

class TFullScreenLaoder{
  static void openLoadingDialog(String text,String animation){
  showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_)=>PopScope(
          canPop: false,
          child: Container(
            color: Colors.white,
           // width: double.infinity,
           // height: double.infinity,
            child: Column(
              children: [
                //const SizedBox(height: 250,),
                TAnimationLoaderWidget(text:text,animation:animation),
              ],
            ),
          )),
  );

}
static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
}
}

