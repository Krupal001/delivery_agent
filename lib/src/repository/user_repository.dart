import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/authentication/models/users_models.dart';

class UserRepository extends GetxController{
  static UserRepository get instance=>Get.find();

  final _db=FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _db.collection("Delivery-agents").add(user.toJson()).whenComplete
      (() => Get.snackbar("Success", "Your account has been created!",
    snackPosition: SnackPosition.TOP,
        backgroundColor:Colors.green,
      colorText: Colors.white),)

    .catchError((error,stackTrace){
      Get.snackbar("Error", "Something went wrong. Try again!",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.redAccent,
      colorText: Colors.red);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
  Future<UserModel>getUserDetails(String email)async{
    final snapshot=await _db.collection("Delivery-agents").where("Email",isEqualTo: email).get();
    final userdata=snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userdata;

  }
}