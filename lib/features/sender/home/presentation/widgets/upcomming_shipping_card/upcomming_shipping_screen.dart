import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/common/widgets/custom_text.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/features/sender/home/presentation/controller/upcomming_shipping_controller.dart';
import 'package:josi/features/sender/home/presentation/widgets/upcomming_shipping_card/upcomming_shipping_card.dart';
import 'package:josi/features/sender/home/traveler_screen/traveler_screen.dart';

class UpcommingShippingScreen extends StatelessWidget {
  const UpcommingShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpcomingShippingController());

    return SingleChildScrollView(
      child: Column(
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'Upcoming Shipping',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to view all screen
                },
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => TravelerScreen());
                  },
                  child: CustomText(
                    text: 'View All',
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          // Shipping Cards List
          Obx(() {
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
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.upcomingShippingList.length,
              itemBuilder: (context, index) {
                final shipping = controller.upcomingShippingList[index];
                return UpcomingShippingCard(
                  shipping: shipping,
                  onBookNow: () => controller.bookShipping(shipping.id),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
