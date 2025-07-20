import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import '../../../../core/common/widgets/custom_appbar.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/reset_password_controller.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 24,right: 24,bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(
                    trailing: IconButton(
                        onPressed: (){
                          Get.back();
                        }, icon: Icon(Icons.arrow_back))),
                CustomText(text: 'Reset Password', fontSize: 24.sp,fontWeight: FontWeight.w700),
                SizedBox(height: 4.h),
                CustomText(text: 'Enter your email, we will send a verification code to your email', fontSize: 16.sp,color: AppColors.textSecondary),
                SizedBox(height: 32.h),
                CustomTextField(
                    prefixIcon: Icon(Icons.email_outlined, color: AppColors.primary),
                    controller: controller.emailText,
                    hintText: 'hello@rafiislam'),
                SizedBox(height: 32.h),
                CustomButton(
                    text: 'Send Code',
                    onTap: (){
                      Get.toNamed(AppRoute.verifyCodeScreenForReset);
                    }),
              ],
            ),
          )),
    );
  }
}
