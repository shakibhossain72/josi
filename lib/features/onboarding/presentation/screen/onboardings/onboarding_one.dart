import 'package:flutter/material.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/image_path.dart';

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          ImagePath.onboardingOne,
          height: height * 0.5,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 30.h),
        CustomText(
          text: 'Send Your Parcels \nIn Just A Few Taps',
          textAlign: TextAlign.center,
          fontSize: 28.sp,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 12.h),
        CustomText(
          text:
              'Effortlessly schedule deliveries and track them in \nreal-time, all from the comfort of your phone.',
          textAlign: TextAlign.center,
          color: AppColors.textSecondary,
        ),
      ],
    );
  }
}
