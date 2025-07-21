import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import 'package:get/get.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Image.asset(IconPath.splashIcon,height: 207.h,width: 189.w),
            Spacer(),
            SpinKitFadingCircle(color: AppColors.primary),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
