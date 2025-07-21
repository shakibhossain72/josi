import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/common/widgets/custom_appbar.dart';
import 'package:josi/core/style/global_text_style.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import 'package:josi/features/sender/profile/screen/faq/controller/faq_controller.dart';

class FAQScreen extends StatelessWidget {
  final FAQController controller = Get.put(FAQController());

  FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              CustomAppbar(
                trailing: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFFFFFF),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                title: 'Edit Profile',
                fontSize: 20.sp,
                centerTitle: true,
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.faqItems.length,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () => controller.toggleExpansion(index),
                              borderRadius: BorderRadius.circular(12),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    Text(
                                      '${index + 1}. ',
                                      style: globalTextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        controller.faqItems[index].question,
                                        style: globalTextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      controller.isExpanded(index)
                                          ? Icons.remove
                                          : Icons.add,
                                      color: AppColors.textPrimary,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 300),
                              crossFadeState: controller.isExpanded(index)
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild: const SizedBox.shrink(),
                              secondChild: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.fromLTRB(
                                  16,
                                  0,
                                  16,
                                  16,
                                ),
                                child: Text(
                                  controller.faqItems[index].answer,
                                  style: globalTextStyle(
                                    fontSize: 14,
                                    color: AppColors.textSecondary,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
