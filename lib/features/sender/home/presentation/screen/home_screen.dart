import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/common/widgets/custom_text.dart';
import 'package:josi/core/style/global_text_style.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import 'package:josi/core/utils/constants/icon_path.dart';
import 'package:josi/features/sender/home/presentation/controller/current_shipping_controller.dart';
import 'package:josi/features/sender/home/presentation/widgets/current_shipping_card/current_shipping_card_sections.dart';
import 'package:josi/features/sender/home/presentation/widgets/upcomming_shipping_card/upcomming_shipping_screen.dart';
import 'package:josi/features/sender/notification/screen/notification_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CurrentShippingController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Fixed Header
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: _buildHeader(),
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.0),
                    _buildSearchBar(),
                    Text(
                      "Current Shipping",
                      style: globalTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ShippingCardsSection(),
                    SizedBox(height: 16),
                    UpcommingShippingScreen(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(
                    'assets/images/user_profile.png',
                    height: 60,
                    width: 60,
                  ),
                ),
              ],
            ),
            SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Hi, Robert Cary!',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: 'Welcome back',
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ],
        ),

        Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => NotificationScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.textSecondary.withValues(alpha: 0.02),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.1),
                      blurRadius: 0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  IconPath.notificationIcon,
                  height: 24,
                  width: 24,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4.0),
      decoration: BoxDecoration(
        // color: Color(0xFFf9f9f9),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(IconPath.searchIcon, height: 20, width: 20),
            SizedBox(width: 12),
            Expanded(
              child: TextField(
                style: globalTextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: 'Search.....',
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintStyle: globalTextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  isDense: true,
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                // showModalBottomSheet(
                //   context: context,
                //   isScrollControlled: true,
                //   backgroundColor: Colors.transparent,
                //   builder: (context) => FilterBottomSheet(),
                // );
              },
              child: Image.asset(IconPath.filterIcon, height: 24, width: 24),
            ),
          ],
        ),
      ),
    );
  }
}
