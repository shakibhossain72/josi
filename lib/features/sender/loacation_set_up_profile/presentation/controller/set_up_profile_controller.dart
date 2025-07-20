import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SetUpProfileController extends GetxController{

  final nameText = TextEditingController();
  final emailText = TextEditingController();
  final phoneText = TextEditingController();
  final addressText = TextEditingController();
  final genderText = TextEditingController();

  final selectGender = ''.obs;

  final List<String> genderType = [
    'Male',
    'Female'
  ];

  void setGender(String category){
    selectGender.value = category;
  }
}