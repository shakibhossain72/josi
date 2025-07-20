import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/common/widgets/custom_appbar.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/common/widgets/custom_rich_text.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/verify_controller.dart';

class VerifyCodeScreen extends GetView<VerifyController> {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppbar(
                trailing: IconButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.chooseRoleScreen);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),

              CustomText(
                text: 'Verification Code',
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 4.h),
              CustomText(
                text:
                    'Enter the verification code that we have sent to your email',
                color: AppColors.textSecondary,
              ),
              SizedBox(height: 24.h),
              Align(
                alignment: Alignment.center,
                child: Pinput(
                  length: 4,
                  controller: controller.otpText,
                  defaultPinTheme: PinTheme(
                    width: 48.w,
                    height: 48.h,
                    textStyle: TextStyle(
                      fontSize: 24,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white, // Default background
                      border: Border.all(
                        color: AppColors.containerBorder,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  submittedPinTheme: PinTheme(
                    width: 48.w,
                    height: 48.h,
                    textStyle: TextStyle(
                      fontSize: 24,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      // color: Color(0xffFFEDF2),
                      border: Border.all(color: AppColors.primary, width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  separatorBuilder: (index) => SizedBox(width: 24),
                ),
              ),
              SizedBox(height: 40.h),
              CustomButton(
                text: 'Continue',
                onTap: () {
                  _verifySuccessPopUp();
                },
              ),
              SizedBox(height: 24.h),
              Obx(
                () => CustomRichText(
                  normalText: "Resend in: ",
                  tappableText: controller.formattedTime,
                  onTap: () {
                    // Optional: Reset timer or resend logic
                    if (controller.remainingSeconds.value == 0) {
                      controller.startTimer();
                      if (kDebugMode) {
                        print("Resending OTP...");
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _verifySuccessPopUp() {
    showDialog(
      context: Get.context!, // Or pass context if you're not using GetX
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(IconPath.verifyIcon, height: 120.h),
              SizedBox(height: 24.h),
              CustomText(text: 'Account  verified Successfully',textAlign: TextAlign.center,fontSize: 20.sp,fontWeight: FontWeight.w600),
              SizedBox(height: 24.h),
              CustomButton(
                text: 'Done',
                onTap: () {
                  Get.toNamed(AppRoute.signInScreen);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
