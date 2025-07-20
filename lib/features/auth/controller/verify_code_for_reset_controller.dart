import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerifyCodeForResetController extends GetxController{

  final otpText = TextEditingController();

  RxInt remainingSeconds = 43.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    _timer?.cancel();
    remainingSeconds.value = 43;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;
      } else {
        timer.cancel();
      }
    });
  }

  String get formattedTime {
    final minutes = (remainingSeconds ~/ 60).toString().padLeft(1, '0');
    final seconds = (remainingSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}