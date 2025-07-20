import 'package:flutter/material.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/image_path.dart';

class OnboardingThree extends StatelessWidget {
  const OnboardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          ImagePath.onboardingThree,
          height: height * 0.5,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 30.h),
        CustomText(
          text: 'Affordable Pricing With \nReal-Time Tracking',
          textAlign: TextAlign.center,
          fontSize: 28.sp,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CustomText(
            text:
                'Know exactly where your package is and when \nit will arrive with live tracking updates.',
            textAlign: TextAlign.center,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
