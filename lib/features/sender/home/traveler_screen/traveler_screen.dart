import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/common/widgets/custom_appbar.dart';
import 'package:josi/core/common/widgets/custom_text.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import 'package:josi/features/sender/home/presentation/controller/upcomming_shipping_controller.dart';
import 'package:josi/features/sender/home/traveler_details_screen/screen/traveler_details_screen.dart';
import 'package:josi/features/sender/home/traveler_screen/traveler_screen_card.dart';

class TravelerScreen extends StatelessWidget {
  TravelerScreen({super.key});
  final controller = Get.put(UpcomingShippingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              CustomAppbar(
                trailing: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                title: 'Traveler',
                centerTitle: true,
                fontSize: 20.sp,
              ),
              Expanded(
                // Add this Expanded widget
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (controller.upcomingShippingList.isEmpty) {
                    return Center(
                      child: CustomText(
                        text: 'No upcoming shipments',
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: controller.upcomingShippingList.length,
                    itemBuilder: (context, index) {
                      final shipping = controller.upcomingShippingList[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            () => TravelerDetailsScreen(shipping: shipping),
                          );
                        },
                        child: TravelerScreenCard(
                          shipping: shipping,
                          onBookNow: () => controller.bookShipping(shipping.id),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
