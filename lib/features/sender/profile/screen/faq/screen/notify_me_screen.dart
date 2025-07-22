import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/common/widgets/custom_appbar.dart';
import 'package:josi/core/common/widgets/custom_button.dart';
import 'package:josi/core/common/widgets/custom_text.dart';
import 'package:josi/core/common/widgets/custom_textformfield.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';

class NotifyMeScreen extends StatelessWidget {
  const NotifyMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        // bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(
              trailing: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back),
              ),
              title: 'Notify Me',
              centerTitle: true,
              fontSize: 20.sp,
            ),

            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Email',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    controller: TextEditingController(),
                    fillColor: Color(0xFFFFFFFF),
                    hintText: 'Enter email',
                  ),

                  SizedBox(height: 20.h),

                  CustomText(
                    text: 'From (Route preference)',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    controller: TextEditingController(),
                    fillColor: Color(0xFFFFFFFF),
                    hintText: 'Write your address',
                  ),

                  SizedBox(height: 20.h),

                  CustomText(
                    text: 'To (Route preference)',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    controller: TextEditingController(),
                    fillColor: Color(0xFFFFFFFF),
                    hintText: 'Write your address',
                  ),
                ],
              ),
            ),

            SizedBox(height: 60),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(text: 'Save', onTap: () {}),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
