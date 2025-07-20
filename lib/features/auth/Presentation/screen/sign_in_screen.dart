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
import '../../controller/sign_in_controller.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

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
                          onPressed: (){
                           Get.back();
                          }, icon: Icon(Icons.arrow_back))),
                  CustomText(text: 'Hey! Welcome back', fontSize: 24.sp,fontWeight: FontWeight.w700),
                  SizedBox(height: 4.h),
                  CustomText(text: 'Sign In to your account', fontSize: 16.sp,color: AppColors.textSecondary),
                  SizedBox(height: 32.h),
                  CustomTextField(
                    prefixIcon: Icon(Icons.email_outlined),
                      controller: controller.emailText,
                      hintText: 'Enter your email'),

                  SizedBox(height: 14.h),
                  Obx(() {
                    return CustomTextField(
                      hintText: 'Enter your password',
                      controller: controller.passText,
                      obscureText: controller.obSecureText.value,
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      suffixIcon: GestureDetector(
                        onTap:
                            () =>
                        controller.obSecureText.value =
                        !controller.obSecureText.value,
                        child:
                        controller.obSecureText.value
                            ? Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.grey,
                        )
                            : Icon(
                          Icons.visibility_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 24.h),
                  Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoute.resetPasswordScreen);
                        },
                          child: CustomText(text: 'Forgot Password?', color: AppColors.primary,fontWeight: FontWeight.w500))),
                  SizedBox(height: 24.h),
                  CustomButton(
                      text: 'Sign In',
                      onTap: (){
                        Get.offAllNamed(AppRoute.allowLocationScreen);
                      }),
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Color(0xffE5E7EC),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8.0),
                        child: CustomText(
                          text: 'Or login with',
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color:  Color(0xffE5E7EC),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 19),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: AppColors.containerBorder)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(IconPath.google, height: 24.h,width: 24.w),
                        SizedBox(width: 8.w),
                        CustomText(text: 'Continue with Google',fontWeight: FontWeight.w600),
                      ],
                    ),
                  ),
                  SizedBox(height: 60.h),
                  CustomRichText(
                      normalText: 'Don’t have an account?',
                      tappableText: ' Register',
                      onTap: (){
                        Get.toNamed(AppRoute.signUpScreen);
                      })
                ],
              ),
            ),
          ))
    );
  }
}
