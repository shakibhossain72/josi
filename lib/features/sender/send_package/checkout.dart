import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/common/widgets/custom_appbar.dart';
import 'package:josi/core/common/widgets/custom_button.dart';
import 'package:josi/core/common/widgets/custom_text.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';

class Checkout extends GetView {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(
                  title: "Checkout",
                  fontSize: 20,
                  centerTitle: true,
                  trailing: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                SizedBox(height: 10.h),

                CustomText(
                  text: 'Package Details',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 40.h),
                CustomText(
                  text: 'From',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                ),
                CustomText(
                  text: 'California, USA',
                  fontSize: 16.sp,
                  // fontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                  color: AppColors.textSecondary,
                ),
                SizedBox(height: 10.h),
                Divider(color: AppColors.textSecondary),
                SizedBox(height: 10.h),
                CustomText(
                  text: 'To',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                ),
                CustomText(
                  text: 'New York, USA',
                  fontSize: 16.sp,
                  // fontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                  color: AppColors.textSecondary,
                ),
                SizedBox(height: 10.h),
                Divider(color: AppColors.textSecondary),
                SizedBox(height: 10.h),
                CustomText(
                  text: 'Package Size',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                ),
                CustomText(
                  text: '3 KG',
                  fontSize: 16.sp,
                  // fontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                  color: AppColors.textSecondary,
                ),
                SizedBox(height: 10.h),
                Divider(color: AppColors.textSecondary),
                SizedBox(height: 10.h),

                CustomText(
                  text: 'Price Details',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: '1 X Package',
                      fontSize: 16.sp,
                      // fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                      color: AppColors.textSecondary,
                    ),
                    CustomText(
                      text: '\$10.00',
                      fontSize: 16.sp,
                      // fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                      color: AppColors.primary,
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Discount',
                      fontSize: 16.sp,
                      // fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                      color: AppColors.textSecondary,
                    ),
                    CustomText(
                      text: '\$1.00',
                      fontSize: 16.sp,
                      // fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                      color: AppColors.primary,
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Tax',
                      fontSize: 16.sp,
                      // fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                      color: AppColors.textSecondary,
                    ),
                    CustomText(
                      text: '\$1.00',
                      fontSize: 16.sp,
                      // fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                      color: AppColors.primary,
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Divider(color: AppColors.textSecondary),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Total Price',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                      color: AppColors.primary,
                    ),
                    CustomText(
                      text: '\$30.00',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                      color: AppColors.primary,
                    ),
                  ],
                ),
                SizedBox(height: 90.h),
                CustomButton(
                  text: 'Next',
                  onTap: () {
                    // Get.toNamed(AppRoute.travelerNavBar);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
