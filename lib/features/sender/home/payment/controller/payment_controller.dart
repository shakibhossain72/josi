import 'package:get/get.dart';

class PaymentController extends GetxController {
  var selectedPaymentMethod = 'PayPal'.obs;

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }
}
