import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/features/sender/booking/controller/booking_controller.dart';
import 'package:josi/features/sender/booking/widget/details_package_tracking_timeline.dart';
import 'package:josi/features/sender/booking/widget/order_details_card.dart';
import '../../../../../core/common/widgets/custom_appbar.dart';

class ViewDetailsScreen extends GetView<BookingController> {
  final int index;
  const ViewDetailsScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final order = controller.orderList[index];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(
                  title: 'View Details',
                  centerTitle: true,
                  trailing: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),

                OrderDetailsCard(
                  statusIndex: order.statusIndex,
                  orderId: "STYW6514VT",
                  from: "South Dakota",
                  to: "New Jersey",
                  startDate: "Jan 10, 2025",
                  endDate: "Jan 14, 2025",
                  statuses: controller.statuses,
                ),
                SizedBox(height: 16),

                PackageTrackingTimeline(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
