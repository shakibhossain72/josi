import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:josi/features/sender/profile/screen/edit_profile_screen.dart';

// Profile Controller
class ProfileController extends GetxController {
  var selectedLanguage = 'English (US)'.obs;
  // Available languages data
  final List<Map<String, String>> languages = [
    {'code': 'en', 'name': 'English', 'flagAsset': 'assets/icons/eng_flag.png'},
    {
      'code': 'fr',
      'name': 'French',
      'flagAsset': 'assets/icons/french_flag.png',
    },
  ];

  // Method to change language
  void changeLanguage(String languageCode) {
    selectedLanguage.value = languageCode;
    // You can add locale change logic here
    // Get.updateLocale(Locale(languageCode));
  }

  var userName = 'Robert Cary'.obs;
  var userEmail = 'robertcary@gmail.com'.obs;
  var userAvatar = 'https://randomuser.me/api/portraits/men/75.jpg';

  Rx<File?> profileImage = Rx<File?>(null); // Observable for image file
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage.value = File(image.path);
    }
  }

  void editProfile() {
    Get.to(() => EditProfileScreen());
    // Navigate to edit profile screen
    if (kDebugMode) {
      print('Edit Profile tapped');
    }
  }

  void openPrivacyPolicy() {
    // Navigate to privacy policy
    if (kDebugMode) {
      print('Privacy Policy tapped');
    }
  }

  void openFAQ() {
    // Navigate to FAQ screen
    if (kDebugMode) {
      print('FAQ tapped');
    }
  }

  void logout() {
    // Handle logout functionality
    Get.dialog(
      AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('Cancel')),
          TextButton(
            onPressed: () {
              // Perform logout
              Get.back();
              if (kDebugMode) {
                print('User logged out');
              }
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
