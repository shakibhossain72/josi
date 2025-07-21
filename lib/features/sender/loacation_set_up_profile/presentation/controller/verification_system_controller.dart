import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:josi/core/utils/constants/image_path.dart';

class VerificationSystemController extends GetxController{

  final ImagePicker _picker = ImagePicker();
  Rx<File?> selectedImage = Rx<File?>(null);
  RxBool isLoading = false.obs;
  RxBool isChecked = false.obs;
  RxBool isCheckBoxError = false.obs;




  RxInt selectedIndex = (-1).obs;
  final items = [
    {
      'title': 'ID',
      'image': ImagePath.userProfile,
    },
    {
      'title': 'Passport',
      'image': ImagePath.userProfile,
    },
    {
      'title': 'Driving License',
      'image': ImagePath.userProfile,
    },
  ].obs;

  void selectItem(int index) {
    selectedIndex.value = index;
    selectedIndex.refresh();
    print('Selected $index');
  }


  Rx<File?> frontImage = Rx<File?>(null);
  Rx<File?> backImage = Rx<File?>(null);

  Future<void> pickImage({required bool isFront, required ImageSource source}) async {
    try {
      isLoading.value = true;
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 80,
      );

      if (image != null) {
        if (isFront) {
          frontImage.value = File(image.path);
        } else {
          backImage.value = File(image.path);
        }
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void removeImage({required bool isFront}) {
    if (isFront) {
      frontImage.value = null;
    } else {
      backImage.value = null;
    }
  }



  bool validateCheckbox() {
    if (!isChecked.value) {
      isCheckBoxError.value = true;
      return false;
    } else {
      isCheckBoxError.value = false;
      return true;
    }
  }



}