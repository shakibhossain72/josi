import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FilterController extends GetxController {
  // Observable variables
  var fromLocation = ''.obs;
  var toLocation = ''.obs;
  var selectedDate = Rxn<DateTime>();
  var selectedWeight = 10.obs;

  // Weight options
  final List<int> weightOptions = [5, 10, 15, 20, 25];

  // Date formatting
  String get formattedDate {
    if (selectedDate.value == null) return 'Choose from calendar';
    return '${selectedDate.value!.day}/${selectedDate.value!.month}/${selectedDate.value!.year}';
  }

  // Methods
  void setFromLocation(String location) {
    fromLocation.value = location;
  }

  void setToLocation(String location) {
    toLocation.value = location;
  }

  void setSelectedWeight(int weight) {
    selectedWeight.value = weight;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFF2E7D32), // Your app's primary color
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Color(0xFF2E7D32)),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  void applyFilter() {
    // Handle filter application logic here
    if (kDebugMode) {
      print('Filter Applied:');
    }
    if (kDebugMode) {
      print('From: ${fromLocation.value}');
    }
    if (kDebugMode) {
      print('To: ${toLocation.value}');
    }
    if (kDebugMode) {
      print('Date: $formattedDate');
    }
    if (kDebugMode) {
      print('Weight: ${selectedWeight.value} kg');
    }

    // Close the bottom sheet
    Get.back();

    // You can add your filter logic here
    // For example, update a filtered list or make an API call
  }

  void resetFilter() {
    fromLocation.value = '';
    toLocation.value = '';
    selectedDate.value = null;
    selectedWeight.value = 10;
  }
}
