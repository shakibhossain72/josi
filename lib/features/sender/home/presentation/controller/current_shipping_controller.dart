import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/features/sender/home/presentation/model/current_shipping_model.dart';

class ShippingController extends GetxController {
  var currentPage = 0.obs;
  var shippingList = <ShippingData>[].obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    loadShippingData();
  }

  void loadShippingData() {
    shippingList.value = ShippingData.getSampleData();
  }

  void updatePage(int page) {
    currentPage.value = page;
  }

  void goToPage(int page) {
    pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
