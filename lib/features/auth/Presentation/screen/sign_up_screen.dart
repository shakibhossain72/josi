import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import '../../../../core/common/widgets/custom_appbar.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/common/widgets/custom_rich_text.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/sign_up_controller.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
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
                ),
                CustomText(
                  text: 'Create Your Account',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: 'Create account and enjoy all services',
                  fontSize: 16.sp,
                  color: AppColors.textSecondary,
                ),
                SizedBox(height: 32.h),
                CustomTextField(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      IconPath.userIcon,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                  controller: controller.nameText,
                  hintText: 'First name',
                ),
                SizedBox(height: 14.h),
                CustomTextField(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      IconPath.userIcon,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                  controller: controller.nameText,
                  hintText: 'Last name',
                ),
                SizedBox(height: 14.h),
                CustomTextField(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      IconPath.emaiIcon,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                  controller: controller.emailText,
                  hintText: 'Email',
                ),
                SizedBox(height: 14.h),
                CustomTextField(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      IconPath.phoneIcon,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                  controller: controller.emailText,
                  hintText: 'Phone',
                ),
                SizedBox(height: 14.h),
                Obx(() {
                  return CustomTextField(
                    hintText: 'Password',
                    controller: controller.confirmPassText,
                    obscureText: controller.obSecureText.value,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        IconPath.passwordIcon,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () => controller.obSecureText.value =
                          !controller.obSecureText.value,
                      child: controller.obSecureText.value
                          ? Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.grey,
                            )
                          : Icon(Icons.visibility_outlined, color: Colors.grey),
                    ),
                  );
                }),
                SizedBox(height: 24.h),
                CustomButton(
                  text: 'Sign Up',
                  onTap: () {
                    Get.toNamed(AppRoute.verifyCodeScreen);
                  },
                ),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Color(0xffE5E7EC), thickness: 1),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomText(
                        text: 'Or Register with',
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Color(0xffE5E7EC), thickness: 1),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 19),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColors.containerBorder),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(IconPath.google, height: 24.h, width: 24.w),
                      SizedBox(width: 8.w),
                      CustomText(
                        text: 'Continue with Google',
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60.h),
                CustomRichText(
                  normalText: 'Already have an account?',
                  tappableText: 'Sign In',
                  onTap: () {
                    Get.toNamed(AppRoute.signInScreen);
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
