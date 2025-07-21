import 'package:get/get.dart';
import 'package:josi/features/sender/message/model/message_model.dart';

class CallController extends GetxController {
  var isCallActive = false.obs;
  var callDuration = 0.obs;
  var isMuted = false.obs;
  var isSpeakerOn = false.obs;
  late User currentUser;

  void initCall(User user) {
    currentUser = user;
    isCallActive.value = true;
    startCallTimer();
  }

  void startCallTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (isCallActive.value) {
        callDuration.value++;
        startCallTimer();
      }
    });
  }

  void endCall() {
    isCallActive.value = false;
    callDuration.value = 0;
    Get.back();
  }

  void toggleMute() {
    isMuted.value = !isMuted.value;
  }

  void toggleSpeaker() {
    isSpeakerOn.value = !isSpeakerOn.value;
  }

  String formatCallDuration(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
