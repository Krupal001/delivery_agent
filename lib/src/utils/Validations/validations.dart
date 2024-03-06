import 'package:get/get.dart';

class Tvalidator{
  //Empty Text validation
  static String? validationEmptyText(String? fieldName,String? value){
    if(value==null || value.isEmpty){
      return '$fieldName is required.';
    }
    return null;
  }

  static String? validateEmail(String ? value){
    if(value==null || value.isEmpty){
      return 'Email is required.';
    }

    //regex for email
    final emailRegEx=RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if(!emailRegEx.hasMatch(value)){
      return "Please enter valid Email";
    }
    return null;
  }

  static String? validatePassword(String? value){
    if(value==null || value.isEmpty){
      return 'Password is required.';
    }
    if(value.length<6) {
      return 'Password must be at least 6 characters long';
    }
    if(!value.contains(RegExp(r'[A-Z]'))){
      return "Password must contains at least one Uppercase letter.";
    }
    if(!value.contains(RegExp(r'[0-9]'))){
      return "Password must contains at least one number.";
    }
    if(!value.contains(RegExp(r"[!@#$%^&*()_+{}\[\]:;<>,.?~\\/\-=|]"))){
      return 'Password must contains at least one special character.';
    }
    return null;
    }

    static String? validatePhoneNumber(String? value){
      if(value==null || value.isEmpty){
        return 'Phone number is required.';
      }
      final phoneRegEx=RegExp(r'^\d{10}$');
      if(!phoneRegEx.hasMatch(value)){
        return 'Invalid Phone Number (10 digits Required.)';
      }
      return null;
    }
    static String? validateNumber(String? value){
      if(value==null || value.isEmpty){
        return 'No Of Parcels is required.';
      }
      if(value=='0'){
        return 'for Delivery Minimum one Parcel is Required';
      }
      final numRegExp=RegExp(r'^[0-9]');
      if(!numRegExp.hasMatch(value)){
        return 'Please enter only number';
      }
      return null;

    }

}

