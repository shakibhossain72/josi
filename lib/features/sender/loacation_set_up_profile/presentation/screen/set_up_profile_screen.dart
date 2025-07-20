import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import 'package:josi/features/sender/loacation_set_up_profile/presentation/controller/set_up_profile_controller.dart';
import '../../../../../core/common/widgets/custom_appbar.dart';
import '../../../../../core/common/widgets/custom_button.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/icon_path.dart';
import '../../../../../routes/app_routes.dart';

class SetUpProfileScreen extends GetView<SetUpProfileController> {
  const SetUpProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppbar(
                    title: 'Set Up Profile',
                    centerTitle: true,
                    // trailing: IconButton(
                    //     onPressed: () {
                    //       Get.back();
                    //     }, icon: Icon(Icons.arrow_back)),
                  ),
                  SizedBox(height: 32.h),
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Image.asset(
                            IconPath.profileIcon, height: 88.h, width: 88.w),
                        Positioned(
                            bottom: 10,
                            right: 0,
                            child: Image.asset(
                                IconPath.profileEdit, height: 24.h,
                                width: 24.w))
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Align(
                      alignment: Alignment.center,
                      child: CustomText(text: 'Upload profile picture',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary)
                  ),
                  SizedBox(height: 52.h),
                  CustomText(text: 'Full Name',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                  SizedBox(height: 10.h),
                  CustomTextField(
                      controller: controller.nameText,
                      hintText: 'Andre Dew'
                  ),
                  SizedBox(height: 20.h),
                  CustomText(text: 'Date of Birth',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                  SizedBox(height: 10.h),
                  CustomTextField(
                      controller: controller.emailText,
                      hintText: 'Date of birth',
                    suffixIcon: Icon(Icons.date_range),
                  ),
                  SizedBox(height: 20.h),
                  CustomText(text: 'Gender',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                  SizedBox(height: 10.h),
                  Obx(() => CustomTextField(
                    controller: controller.genderText,
                    hintText: controller.selectGender.value.isEmpty
                        ? 'Select Gender'
                        : controller.selectGender.value,
                    readOnly: true,
                    suffixIcon: PopupMenuButton<String>(
                      color: AppColors.white,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      onSelected: controller.setGender,
                      itemBuilder: (BuildContext context) {
                        return controller.genderType.map((String category) {
                          return PopupMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList();
                      },
                    ),
                  )),
                  SizedBox(height: 20.h),
                  CustomText(text: 'Address',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                  SizedBox(height: 10.h),
                  CustomTextField(
                      controller: controller.emailText,
                      hintText: 'Enter your address'
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                      text: 'Next',
                      onTap: (){
                        Get.toNamed(AppRoute.navBar);
                      })
                ],
              ),
            ),
          ),
        )
    );
  }
}
