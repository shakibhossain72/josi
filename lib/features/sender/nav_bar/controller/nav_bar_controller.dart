import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../booking/presentation/screen/booking_screen.dart';
import '../../home/presentation/screen/home_screen.dart';


class NavBarController extends GetxController {
  final _selectedIndex = 0.obs;
  int get currentIndex => _selectedIndex.value;

  void changeIndex(int index) {
    _selectedIndex.value = index;
  }

  final List<Widget> screens = [
    HomeScreen(),
    BookingScreen(),
    HomeScreen(),
    HomeScreen(),

  ];

  final List<String> labels = const [
    'Home',
    'My Booking',
    'Message',
    'Profile',
  ];

  final List<String> iconPaths = [
    IconPath.home,
    IconPath.booking,
    IconPath.message,
    IconPath.profile,
  ];

  void backToHome() {
    changeIndex(0);
  }
}
