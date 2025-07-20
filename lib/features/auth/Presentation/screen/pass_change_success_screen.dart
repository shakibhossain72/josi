import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../routes/app_routes.dart';

class PassChangeSuccessScreen extends StatelessWidget {
  const PassChangeSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24,right: 24,bottom: 24),
          child: Column(
            children: [
              Spacer(),
              Image.asset(IconPath.pcSuccessIcon, height: 160.h,width: 160.w),
              SizedBox(height: 36.h),
              CustomText(text: 'Password Change', fontWeight: FontWeight.w600,fontSize: 18),
              SizedBox(height: 12.h),
              CustomText(text: 'Password changed successfully, you can login again with new password',textAlign: TextAlign.center,fontSize: 16.sp,color: AppColors.textSecondary),
              Spacer(),
              CustomButton(
                  text: 'Sign In',
                  onTap: (){
                    Get.toNamed(AppRoute.signInScreen);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
