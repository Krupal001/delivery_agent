import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ParcelBookingController extends GetxController{
  static ParcelBookingController get instance=>Get.find();

  final sendername=TextEditingController();
  final recipientNameController = TextEditingController();
  final recipientAddressController = TextEditingController();
  final itemDescriptionController = TextEditingController();
  final itemCountController = TextEditingController();


}