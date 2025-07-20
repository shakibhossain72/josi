import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/common/widgets/custom_text.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import 'package:josi/features/sender/loacation_set_up_profile/presentation/controller/verification_system_controller.dart';
import '../../../../../core/common/widgets/custom_appbar.dart';

class VerificationSystemScreen extends StatelessWidget {
   VerificationSystemScreen({super.key});

   final controller = Get.put(VerificationSystemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppbar(
                    title: 'Upload Documents',
                    centerTitle: true,
                    trailing: IconButton(
                        onPressed: () {
                          Get.back();
                        }, icon: Icon(Icons.arrow_back)),
                  ),
                  SizedBox(height: 24.h),
                  CustomText(text: 'Choose document type', fontSize: 18.sp,fontWeight: FontWeight.w500),
                  SizedBox(height: 16.sp),
                  Obx(() {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.items.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.9, // adjust as needed
                        ),
                        itemBuilder: (context, index) {
                          final item = controller.items[index];
                          final isSelected = controller.selectedIndex.value == index;

                          return GestureDetector(
                            onTap: () => controller.selectItem(index),
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.transparent,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: isSelected ? AppColors.primary : Colors.grey,
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.camera_alt_outlined,size: 24),
                                  const SizedBox(height: 8),
                                  CustomText(
                                    text: item['title']!,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500,
                                    color: isSelected ? AppColors.primary : AppColors.textPrimary,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),


                ],
              ),
            ),
          )),
    );
  }
}
