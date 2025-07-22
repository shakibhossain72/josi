// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class OrderCard extends StatelessWidget {
//   final int statusIndex;
//   final String orderId;
//   final String from;
//   final String to;
//   final String startDate;
//   final String endDate;
//   final List<String> statuses;
//
//   const OrderCard({
//     required this.statusIndex,
//     required this.orderId,
//     required this.from,
//     required this.to,
//     required this.startDate,
//     required this.endDate,
//     required this.statuses,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 20),
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Status + ID Row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   padding:
//                   const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade200,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Text(
//                     statuses[statusIndex],
//                     style: const TextStyle(fontSize: 12),
//                   ),
//                 ),
//                 Text("ID: $orderId",
//                     style:
//                     const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
//               ],
//             ),
//             const SizedBox(height: 16),
//
//             // Progress bar
//             Row(
//               children: List.generate(4, (i) {
//                 final isActive = i <= statusIndex;
//                 return Expanded(
//                   child: Row(
//                     children: [
//                       if (i != 0) Expanded(child: Divider(color: isActive ? Colors.black : Colors.grey.shade300, thickness: 2)),
//                       CircleAvatar(
//                         radius: 12,
//                         backgroundColor: isActive ? Colors.black : Colors.grey.shade300,
//                         child: i == statusIndex
//                             ? const Icon(Icons.local_shipping, size: 14, color: Colors.white)
//                             : null,
//                       ),
//                       if (i != 3)
//                         Expanded(child: Divider(color: i < statusIndex ? Colors.black : Colors.grey.shade300, thickness: 2)),
//                     ],
//                   ),
//                 );
//               }),
//             ),
//             const SizedBox(height: 16),
//
//             // Location & Date
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(startDate, style: const TextStyle(fontSize: 12)),
//                     Text(from,
//                         style: const TextStyle(
//                             fontWeight: FontWeight.w600, fontSize: 14)),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text(endDate, style: const TextStyle(fontSize: 12)),
//                     Text(to,
//                         style: const TextStyle(
//                             fontWeight: FontWeight.w600, fontSize: 14)),
//                   ],
//                 ),
//               ],
//             ),
//
//             const SizedBox(height: 16),
//
//             // Buttons
//             Row(
//               children: [
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: () {},
//                     style: OutlinedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       side: const BorderSide(color: Colors.black),
//                     ),
//                     child: const Text("View Details"),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red.shade100,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                     child: const Text("Cancel Order", style: TextStyle(color: Colors.red)),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:josi/core/common/widgets/custom_button_cancel.dart';
import 'package:josi/core/common/widgets/custom_text.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import 'package:josi/routes/app_routes.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:get/get.dart';

class OrderCard extends StatelessWidget {
  final int statusIndex;
  final String orderId;
  final String from;
  final String to;
  final String startDate;
  final String endDate;
  final List<String> statuses;

  const OrderCard({
    super.key,
    required this.statusIndex,
    required this.orderId,
    required this.from,
    required this.to,
    required this.startDate,
    required this.endDate,
    required this.statuses,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.containerBorder, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Status + ID
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CustomText(text: statuses[statusIndex], fontSize: 12.sp),
              ),
              CustomText(text: "ID: $orderId", fontWeight: FontWeight.w600),
            ],
          ),

          const SizedBox(height: 20),

          /// TimelinePlus horizontal timeline - Fixed height added
          LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                height: 60,
                width: constraints.maxWidth, // Takes full available width
                child: FixedTimeline.tileBuilder(
                  theme: TimelineThemeData(
                    direction: Axis.horizontal,
                    nodePosition: 0,
                    indicatorPosition: 0.5,
                    connectorTheme: ConnectorThemeData(
                      thickness: 3.0,
                      color: Colors.grey.shade300,
                    ),
                    indicatorTheme: IndicatorThemeData(size: 24.0),
                  ),
                  builder: TimelineTileBuilder.connected(
                    connectionDirection: ConnectionDirection.before,
                    itemCount: statuses.length,
                    contentsAlign: ContentsAlign.basic,
                    contentsBuilder: (_, index) => SizedBox(
                      width:
                          constraints.maxWidth /
                          statuses.length, // Equal width for each status
                      // child: Padding(
                      //   padding: const EdgeInsets.only(top: 8.0),
                      //   child: Text(
                      //     statuses[index],
                      //     style: TextStyle(
                      //       fontSize: 12.sp,
                      //       fontWeight: FontWeight.w500,
                      //       color: index <= statusIndex ? AppColors.textPrimary : AppColors.textSecondary,
                      //     ),
                      //     textAlign: TextAlign.center, // Center text in its space
                      //   ),
                      // ),
                    ),
                    indicatorBuilder: (_, index) => DotIndicator(
                      size: 24.0,
                      color: index <= statusIndex
                          ? Colors.black
                          : Colors.grey.shade300,
                      child: index == statusIndex
                          ? const Icon(
                              Icons.local_shipping,
                              size: 12,
                              color: Colors.white,
                            )
                          : null,
                    ),
                    connectorBuilder: (_, index, __) => SolidLineConnector(
                      color: index < statusIndex
                          ? Colors.black
                          : Colors.grey.shade300,
                    ),
                  ),
                ),
              );
            },
          ),

          // Date & Location
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: startDate,
                    fontSize: 12.sp,
                    color: AppColors.textSecondary,
                  ),
                  CustomText(
                    text: from,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                    text: endDate,
                    fontSize: 12.sp,
                    color: AppColors.textSecondary,
                  ),
                  CustomText(
                    text: to,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.viewDetailsScreen);
                  },
                  child: CustomText(text: 'View Details'),
                ),
              ),
              SizedBox(width: 16),
              if (statuses[statusIndex] == 'Package Delivered')
                Expanded(
                  child: CustomButtonCancel(
                    backgroundColor: Colors.black,
                    textColor: Color(0xFFFFFFFF),
                    text: 'Give Review',
                    height: 12,
                    onPressed: () {
                      //Get.toNamed(AppRoute.writeReviewScreen);
                      Get.toNamed(AppRoute.writeReviewScreen);
                    },
                  ),
                ),
              if (statuses[statusIndex] != 'Package Delivered')
                Expanded(
                  child: CustomButtonCancel(
                    backgroundColor: Color(0xfffeeded),
                    textColor: Color(0xffEF4444),
                    text: 'Cancel',
                    onPressed: () {
                      //Get.toNamed(AppRoute.writeReviewScreen);
                      Get.toNamed(AppRoute.cancelOrderScreen);
                    },
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
