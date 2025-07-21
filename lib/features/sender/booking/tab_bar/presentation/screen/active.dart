import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/features/sender/booking/controller/booking_controller.dart';

import '../../../widget/order_card.dart';

class Active extends GetView<BookingController> {
  const Active({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: controller.orderList.length,
              itemBuilder: (context, index) {
                final order = controller.orderList[index];
                return OrderCard(
                  statusIndex: order.statusIndex,
                  orderId: "STYW6514VT",
                  from: "South Dakota",
                  to: "New Jersey",
                  startDate: "Jan 10, 2025",
                  endDate: "Jan 14, 2025",
                  statuses: controller.statuses,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
