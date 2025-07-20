import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import '../../../../../core/style/global_text_style.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../controller/nav_bar_controller.dart';

class TravelerNavBar extends StatelessWidget {
  const TravelerNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavBarController());
    return Scaffold(
      body: Obx(() {
        return controller.screens[controller.currentIndex];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: controller.currentIndex,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Color(0xFF7C8091),
          showUnselectedLabels: true,
          onTap: controller.changeIndex,
          items: List.generate(controller.labels.length, (index) {
            return BottomNavigationBarItem(
              backgroundColor: AppColors.white,
              icon: Image.asset(
                controller.iconPaths[index],
                height: 26.h,
                width: 26.w,
                fit: BoxFit.fill,
                color: controller.currentIndex == index
                    ? AppColors.primary
                    : Color(0xFF636F85),
              ),
              label: controller.labels[index],
              tooltip: controller.labels[index],
            );
          }),
          selectedLabelStyle: globalTextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 11.sp,
            color: AppColors.primary,
          ),
          unselectedLabelStyle: globalTextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 11.sp,
            color: Color(0xFF636F85),
          ),
        );
      }),
    );
  }
}
