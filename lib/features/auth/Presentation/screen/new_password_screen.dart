import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import '../../../../core/common/widgets/custom_appbar.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/new_password_controller.dart';

class NewPasswordScreen extends GetView<NewPasswordController> {
  const NewPasswordScreen({super.key});

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
                        onPressed: (){
                          Get.back();
                        }, icon: Icon(Icons.arrow_back))),
                CustomText(text: 'Create New Password', fontSize: 24.sp,fontWeight: FontWeight.w600),
                SizedBox(height: 4.h),
                CustomText(text: 'Your password must be different from previous used password',color: AppColors.textSecondary),
                SizedBox(height: 24.h),
                Obx(() {
                  return CustomTextField(
                    hintText: 'New Password',
                    controller: controller.newPassText,
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
                Obx(() {
                  return CustomTextField(
                    hintText: 'Confirm password',
                    controller: controller.confirmPassText,
                    obscureText: controller.obSecureText2.value,
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    suffixIcon: GestureDetector(
                      onTap:
                          () =>
                      controller.obSecureText2.value =
                      !controller.obSecureText2.value,
                      child:
                      controller.obSecureText2.value
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
                
                SizedBox(height: 30.h),
               CustomButton(
                   text: 'Reset Password',
                   onTap: (){
                     Get.toNamed(AppRoute.passChangeSuccessScreen);
                   })
              ],
            ),
          )),
    );
  }
}
