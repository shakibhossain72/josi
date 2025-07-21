import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/common/widgets/custom_button.dart';
import 'package:josi/core/common/widgets/custom_text.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import 'package:josi/features/sender/booking/controller/booking_controller.dart';
import 'package:josi/features/sender/booking/controller/write_review_controller.dart';
import 'package:josi/routes/app_routes.dart';
import '../../../../../core/common/widgets/custom_appbar.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/icon_path.dart';
import '../../widget/order_card.dart';

class WriteReviewScreen extends StatelessWidget {
  final int index;

   WriteReviewScreen({super.key,required this.index});

   final controller = Get.put(WriteReviewController());
   final bookingController = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {

    final order = bookingController.orderList[index];
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppbar(
                    title: 'Write A Review',
                    centerTitle: true,
                    trailing: IconButton(
                        onPressed: () {
                          Get.back();
                        }, icon: Icon(Icons.arrow_back)),
                  ),
                  SizedBox(height: 16.h),
                  OrderCard(
                    statusIndex: order.statusIndex,
                    orderId: "STYW6514VT",
                    from: "South Dakota",
                    to: "New Jersey",
                    startDate: "Jan 10, 2025",
                    endDate: "Jan 14, 2025",
                    statuses: bookingController.statuses,
                  ),

                  SizedBox(height: 38),
                  CustomText(text: 'Please give your rating with us',fontSize: 16.sp,fontWeight: FontWeight.w500),
                  Obx(() => Row(
                      children: List.generate(5, (index) {
                        return IconButton(
                          icon: Icon(
                            index < controller.rating.value
                                ? Icons.star
                                : Icons.star_border,
                            size: 40,
                            color: Colors.amber,
                          ),
                          onPressed: () => controller.setRating(index + 1),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 38),
                  CustomText(text: 'Write comment', fontSize: 16.sp,fontWeight: FontWeight.w500),
                  SizedBox(height: 16.h),
                  TextField(
                    controller: controller.writeComment,
                    decoration: InputDecoration(
                      hintText: 'Please share your experience with us.',
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
                    maxLines: 4,
                  ),
                  SizedBox(height: 90),
                  CustomButton(
                      text: 'Submit',
                      onTap: (){
                        _reviewPopUp();
                      })

                ],
              ),
            ),
          )),
    );
  }

  void _reviewPopUp() {
    showDialog(
      context: Get.context!, // Or pass context if you're not using GetX
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(IconPath.checkIcon, height: 90.h, width: 90.w),
              CustomText(
                text: 'Thanks!',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 4.h),
              CustomText(
                text: 'Thanks for your valuable feedback',
                color: AppColors.textSecondary,
              ),
              SizedBox(height: 16.h),
              CustomButton(
                text: 'Done',
                onTap: () {
                  Get.toNamed(AppRoute.navBar);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
