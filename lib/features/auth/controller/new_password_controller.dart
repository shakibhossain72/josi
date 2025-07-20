import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController{

  final newPassText = TextEditingController();
  final confirmPassText = TextEditingController();

  final isNewPasswordHidden = true.obs;
  final isConPasswordHidden = true.obs;
  final RxBool obSecureText = true.obs;
  final RxBool obSecureText2 = true.obs;

  void togglePasswordVisibility() {
    isNewPasswordHidden.value = !isNewPasswordHidden.value;
  }

  void toggleConfirmPassVisibility() {
    isConPasswordHidden.value = !isConPasswordHidden.value;
  }
}