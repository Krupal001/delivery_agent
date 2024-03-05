import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../repository/authentication_repository.dart';
import '../../../utils/helper/helper_controller.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();


  final isGoogleLoading=false.obs;
  /// TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();

  /// TextField Validation

  //Call this Function from Design & it will do the rest
  void login(String email,String password) {
    AuthenticationRepository.instance.loginWithEmailAndPassword(email, password);
  }
  Future<void> googleSignIn()async{
    try{
      isGoogleLoading.value=true;
      await AuthenticationRepository.instance.signInWithGoogle();
      isGoogleLoading.value=false;
      final auth=AuthenticationRepository.instance;
      auth.setInitialScreen(auth.firebaseUser.value);
    }catch(e){
      isGoogleLoading.value=false;
      Helper.errorSnackBar(title: "Error",message:e.toString());
    }

  }
}