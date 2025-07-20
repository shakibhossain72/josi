import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../routes/app_routes.dart';
import '../../controller/onboarding_controller.dart';
import 'onboardings/onboarding_one.dart';
import 'onboardings/onboarding_three.dart';
import 'onboardings/onboarding_two.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());
  final PageController pageController = PageController();

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: controller.updatePage,
              children: [OnboardingOne(), OnboardingTwo(), OnboardingThree()],
            ),
          ),
          Obx(() {
            final isLast = controller.currentPage.value == 2;
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 40,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        final selected = controller.currentPage.value == index;
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: selected ? 32 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: selected
                                ? AppColors.primary
                                : Colors.grey.withAlpha(200),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 50.h),
                    CustomButton(
                      text: isLast ? "Get Started" : "Next",
                      onTap: () {
                        if (isLast) {
                          Get.offAllNamed(AppRoute.chooseRoleScreen);
                        } else {
                          pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
