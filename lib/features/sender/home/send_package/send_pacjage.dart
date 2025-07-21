import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:josi/core/common/widgets/custom_appbar.dart';
import 'package:josi/core/common/widgets/custom_button.dart';
import 'package:josi/core/common/widgets/custom_text.dart';
import 'package:josi/core/common/widgets/custom_textformfield.dart';
import 'package:josi/core/style/global_text_style.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import 'package:josi/features/sender/home/send_package/checkout.dart';
import 'package:josi/features/sender/home/send_package/controller/sent_package_controller.dart';

class Sentpackage extends GetView<SentPackageController> {
  const Sentpackage({super.key});

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
                  title: "Send Package",
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
                  text: 'Upload profile picture',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 52.h),
                CustomText(
                  text: 'Name',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                ),

                SizedBox(height: 10.h),
                CustomTextField(
                  controller: controller.nameText,
                  hintText: 'Name',
                  fillColor: Colors.white,
                ),
                SizedBox(height: 10.h),
                CustomText(
                  text: 'Phone',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                ),

                SizedBox(height: 10.h),
                CustomTextField(
                  controller: controller.phoneText,
                  hintText: '(219) 555-0114',
                  fillColor: Colors.white,
                ),
                SizedBox(height: 10.h),
                CustomText(
                  text: 'Address',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                ),

                SizedBox(height: 10.h),
                CustomTextField(
                  controller: controller.addressText,
                  hintText: 'Florida,  USA',
                  fillColor: Colors.white,
                ),
                SizedBox(height: 10.h),
                CustomText(
                  text: 'Note',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                ),

                SizedBox(height: 10.h),

                TextField(
                  controller: controller.noteText,
                  maxLines: 4,

                  keyboardType: TextInputType.text,
                  style: globalTextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),

                  decoration: InputDecoration(
                    hintText: "Enter Message",

                    hintStyle: GoogleFonts.dmSans(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      height: 20 / 14,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffe7e9ed),
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffe7e9ed),
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 14.h,
                      horizontal: 12.w,
                    ),
                  ),
                ),
                SizedBox(height: 90.h),
                CustomButton(
                  text: 'Next',
                  onTap: () {
                    Get.to(() => Checkout());
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
