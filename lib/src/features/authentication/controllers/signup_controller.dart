import 'package:delivery_agent/src/repository/authentication_repository.dart';
import 'package:delivery_agent/src/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/helper/helper_controller.dart';
import '../models/users_models.dart';

class SignupController extends GetxController{
  static SignupController get instance=>Get.find();
  final isGoogleLoading=false.obs;
  final userRepo=Get.put(UserRepository());
  final hidePassword=true.obs;
  final email=TextEditingController();
  final password=TextEditingController();
  final name=TextEditingController();
  final phoneNo=TextEditingController();

  //call this function from design and it will do the rest
  void registerUser(String email,String password){
    //TFullScreenLaoder.openLoadingDialog("We are processing your information ..", "assets/images/Animation_loader.gif");
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
  }
  Future<void> googleSignIn()async {
    try {
      isGoogleLoading.value = true;
      await AuthenticationRepository.instance.signInWithGoogle();
      isGoogleLoading.value = false;
      final auth=AuthenticationRepository.instance;
      auth.setInitialScreen(auth.firebaseUser.value);

    } catch (e) {
      isGoogleLoading.value = false;
      Helper.errorSnackBar(title: "Error", message: e.toString());
    }
  }
  }