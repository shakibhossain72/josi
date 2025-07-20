import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../core/common/app_snackber.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/services/Auth_service.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/choose_role_controlller.dart';

class ChooseRoleScreen extends GetView<ChooseRoleController> {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              CustomText(
                text: 'Choose Your Role',
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 4.h),
              CustomText(
                text: 'You have to choose a role to continue.',
                color: AppColors.textSecondary,
              ),
              SizedBox(height: 32.h),

              Column(
                children: List.generate(2, (index) {
                  return Obx(() {
                    final isSelected = controller.selectedRadio.value == index;
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary : AppColors.white,
                        border: Border.all(
                          color: isSelected
                              ? Colors.transparent
                              : AppColors.containerBorder,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            index == 0
                                ? IconPath.personIcon
                                : IconPath.personIcon,
                            height: 25.h,
                            width: 22.w,
                            // ignore: deprecated_member_use
                            color: isSelected
                                ? AppColors.white
                                : AppColors.textPrimary,
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: CustomText(
                              text: index == 0
                                  ? "I'm a Sender"
                                  : "I'm a Traveler",
                              fontSize: 13.sp,
                              color: isSelected
                                  ? AppColors.white
                                  : AppColors.textPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Radio<int>(
                            value: index,
                            groupValue: controller.selectedRadio.value,
                            onChanged: (value) {
                              controller.selectedRadio.value = value!;
                            },
                            activeColor: AppColors.white,
                          ),
                        ],
                      ),
                    );
                  });
                }),
              ),

              Spacer(),
              CustomButton(
                text: 'Next',
                onTap: () async {
                  if (controller.selectedRadio.value == 0) {
                    // Save the selected role as 'USER'
                    await AuthService.saveRole('SENDER');
                    Get.toNamed(AppRoute.signInScreen);
                  } else if (controller.selectedRadio.value == 1) {
                    // Save the selected role as 'WORKER'
                    await AuthService.saveRole('TRAVELER');
                    Get.toNamed(AppRoute.signInScreen);
                  } else {
                    AppSnackBar.showError('Please select a role');
                  }
                },
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
