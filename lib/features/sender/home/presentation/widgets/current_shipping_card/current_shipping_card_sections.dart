import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/features/sender/home/presentation/controller/current_shipping_controller.dart';
import 'package:josi/features/sender/home/presentation/widgets/current_shipping_card/current_shiping_card.dart';

class ShippingCardsSection extends StatelessWidget {
  const ShippingCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final CurrentShippingController controller =
        Get.find<CurrentShippingController>();

    return SizedBox(
      width: double.infinity,
      height: 240,
      child: Column(
        children: [
          Expanded(
            child: Obx(
              () => PageView.builder(
                controller: controller.pageController,
                onPageChanged: (index) {
                  controller.updatePage(index);
                },
                itemCount: controller.shippingList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    child: ShippingCard(data: controller.shippingList[index]),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 16),
          // Page Indicators
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.shippingList.length,
                (index) => GestureDetector(
                  onTap: () => controller.goToPage(index),
                  child: Container(
                    width: controller.currentPage.value == index ? 12 : 8,
                    height: 8,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: controller.currentPage.value == index
                          ? Colors.black
                          : Colors.grey[400],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
