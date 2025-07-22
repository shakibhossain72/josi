import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import '../../../../../core/common/widgets/custom_button.dart';
import '../../../../../core/common/widgets/custom_outline_button.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/services/Auth_service.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/icon_path.dart';
import '../../../../../routes/app_routes.dart';

class AllowLocationScreen extends StatelessWidget {
  const AllowLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff969696),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Color(0xff969696)),
            child: Center(
              child: Image.asset(
                IconPath.allowLocationIcon,
                height: 200.h,
                width: 200.w,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 600,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(26),
                  topLeft: Radius.circular(26),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 27, right: 27),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Allow Access",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 9.h),
                    CustomText(
                      text:
                          'To enjoy your ride experience Please allow us the following permissions',
                      textAlign: TextAlign.center,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Icon(Icons.location_on_rounded, color: Colors.grey),
                        CustomText(
                          text: ' Allow Location all the time - To book a taxi',
                          color: AppColors.textSecondary,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on_rounded, color: Colors.grey),
                        Expanded(
                          child: CustomText(
                            text:
                                ' Enable Background Location - to give you ride \nrequest even if your app is in background',
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    CustomButton(
                      text: 'Allow Access',
                      onTap: () {
                        _allowLocationPopUp();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _allowLocationPopUp() {
    showDialog(
      context: Get.context!, // Or pass context if you're not using GetX
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(IconPath.locationIcon, height: 50.h, width: 50.w),
              SizedBox(height: 16.h),
              CustomText(
                text: 'Allow Routes Driver to access this device’s location?',
                textAlign: TextAlign.center,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 20.h),
              CustomButton(
                text: 'While using the app',
                onTap: () {
                  if (AuthService.userRole == "SENDER") {
                    Get.offAllNamed(AppRoute.navBar);
                  } else {
                    Get.offAllNamed(AppRoute.travelerNavBar);
                  }
                },
              ),
              SizedBox(height: 16.h),
              CustomOutlineButton(
                text: 'One this time',
                onPressed: () {
                  if (AuthService.userRole == "SENDER") {
                    Get.offAllNamed(AppRoute.navBar);
                  } else {
                    Get.offAllNamed(AppRoute.navBar);
                  }
                },
              ),
              SizedBox(height: 24.h),
              TextButton(
                onPressed: () {
                  if (AuthService.userRole == "SENDER") {
                    Get.offAllNamed(AppRoute.navBar);
                  } else {
                    Get.offAllNamed(AppRoute.navBar);
                  }
                },
                child: CustomText(
                  text: "Don't allow",
                  color: Color(0xff7C8091),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
