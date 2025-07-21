import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import 'package:josi/routes/app_routes.dart';
import '../../../../../core/common/widgets/custom_appbar.dart';
import '../../../../../core/common/widgets/custom_button.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../controller/cancel_controller.dart';

class CancelOrderScreen extends GetView<CancelController> {
  CancelOrderScreen({super.key});

  final List<String> reasons = [
    'Some other work, can’t come',
    'I am out of town ',
    'I have better deal',
    'I want to book another event',
    'I just want to cancel',
    'Event location is too far from my location',
    'Other reason',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(
                  trailing: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  title: 'Cancel Service ',
                  fontSize: 20.sp,
                  centerTitle: true,
                ),

                CustomText(
                  text: 'Please select the reason for \ncancellation:',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 48),
                CustomText(
                  text: 'Select a Reason',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),

               // SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: reasons.length,
                  itemBuilder: (context, index) {
                    return Obx(
                          () => RadioListTile<String>(
                            contentPadding: EdgeInsets.zero,
                        activeColor: AppColors.primary,
                        title: CustomText(
                          text: reasons[index],
                          fontSize: 16.sp,
                          color: AppColors.primary,
                        ),
                        value: reasons[index],
                        groupValue: controller.selectedReason.value,
                        onChanged: (value) {
                          controller.selectReason(value!);
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                Obx(() => controller.selectedReason.value == 'Other reason'
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Other',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 10),
                      TextField(
                        onChanged: controller.updateCustomReason,
                        decoration: InputDecoration(
                          hintText: 'Other reason...',
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textSecondary,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: AppColors.containerBorder,
                            ), // Default state
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: AppColors.containerBorder,
                              width: 2,
                            ), // Focused state
                          ),
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(height: 10),
                    ],
                  )
                      : SizedBox.shrink(),
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: "Confirm",
                  onTap: () {
                    _cancelPopUp();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _cancelPopUp() {
    showDialog(
      context: Get.context!, // Or pass context if you're not using GetX
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: 'Your order has been cancelled!',
                textAlign: TextAlign.center,
                color: AppColors.primary,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 16.h),
              CustomText(
                text:
                'We will continue to improve our service & satisfy you on the next order.',
                textAlign: TextAlign.center,
                color: AppColors.textSecondary,
                fontSize: 16.sp,
              ),
              SizedBox(height: 32.h),
              CustomButton(text: 'Ok',
                  onTap: () {
                      Get.toNamed(AppRoute.navBar);
                  }),
            ],
          ),
        );
      },
    );
  }
}
