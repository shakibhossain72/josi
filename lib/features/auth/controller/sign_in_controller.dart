import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{

  final emailText = TextEditingController();
  final passText = TextEditingController();

  final isNewPasswordHidden = true.obs;
  final RxBool obSecureText = true.obs;

  void togglePasswordVisibility() {
    isNewPasswordHidden.value = !isNewPasswordHidden.value;
  }
}