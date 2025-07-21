import 'package:get/get.dart';

class CancelController extends GetxController{

  final RxString selectedReason = ''.obs;
  final RxString customReason = ''.obs;

  void selectReason(String reason) {
    selectedReason.value = reason;
  }

  void updateCustomReason(String reason) {
    customReason.value = reason;
  }

  void submitCancellation() {
    final reason = selectedReason.value == 'Others'
        ? customReason.value
        : selectedReason.value;

    if (reason.isEmpty) {
      Get.snackbar('Error', 'Please select a cancellation reason');
      return;
    }

    // Here you would typically send the reason to your backend
    Get.back(result: reason);
    Get.snackbar('Success', 'Cancellation submitted');
  }
}