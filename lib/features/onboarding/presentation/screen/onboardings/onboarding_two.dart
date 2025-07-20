import 'package:flutter/material.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/image_path.dart';

class OnboardingTwo extends StatelessWidget {
  const OnboardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          ImagePath.onboardingTwo,
          height: height * 0.5,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 30.h),
        CustomText(
          text: 'Experience The Fast and \nReliable Deliveries',
          textAlign: TextAlign.center,
          fontSize: 28.sp,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 12.h),
        CustomText(
          text:
              'Count on us to get your parcels delivered \nquickly and securely, every single time.',
          textAlign: TextAlign.center,
          color: AppColors.textSecondary,
        ),
      ],
    );
  }
}
