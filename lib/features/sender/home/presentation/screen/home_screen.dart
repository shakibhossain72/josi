import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/common/widgets/custom_text.dart';
import 'package:josi/core/style/global_text_style.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import 'package:josi/core/utils/constants/icon_path.dart';
import 'package:josi/features/sender/home/presentation/controller/current_shipping_controller.dart';
import 'package:josi/features/sender/home/presentation/widgets/current_shipping_card_sections.dart';
import 'package:josi/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    Get.put(ShippingController());

    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Stack(
        children: [
          Column(
            children: [
              // Header with profile and search
              Container(
                height: 350,
                padding: EdgeInsets.only(top: 45),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(),
                      SizedBox(height: 20),
                      _buildSearchBar(),
                      // SizedBox(height: ),
                      Text(
                        "Current Shipping",
                        style: globalTextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 80), // Space for the floating cards
              // Expanded(
              //   child: Padding(
              //     padding: EdgeInsets.all(16),
              //     child: Column(
              //       children: [
              //         Text(
              //           'Other Content Here',
              //           style: globalTextStyle(fontSize: 16),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),

          // Floating Shipping Cards
          Positioned(
            top: 220,
            left: 0,
            right: 0,
            child: ShippingCardsSection(),
          ),
        ],
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
                Get.toNamed(AppRoute.sentpackagescreen);
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
        color: Color(0xFFf9f9f9),
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
