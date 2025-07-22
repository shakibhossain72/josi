import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/common/widgets/custom_appbar.dart';
import 'package:josi/core/style/global_text_style.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import 'package:josi/features/sender/booking/controller/booking_controller.dart';
import 'package:josi/features/sender/booking/tab_bar/controller/tab_bar_controller.dart';
import 'package:josi/features/sender/booking/tab_bar/presentation/screen/active.dart';
import 'package:josi/features/sender/booking/tab_bar/presentation/screen/cancelled.dart';
import 'package:josi/features/sender/booking/tab_bar/presentation/screen/completed.dart';
import 'package:josi/features/sender/booking/tab_bar/presentation/screen/pending.dart';

import '../../../../../core/utils/constants/app_colors.dart';

class BookingScreen extends GetView<BookingController> {
  BookingScreen({super.key});

  final tabBarController = Get.put(TabBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(title: 'My Booking', centerTitle: true),
            // Tab Bar Section
            TabBar(
              controller: tabBarController.tabController,
              labelColor: AppColors.primary,
              // isScrollable: true,
              labelPadding: EdgeInsets.symmetric(horizontal: 12),
              labelStyle: globalTextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
              dividerColor: Color(0xffD1D6DB),
              dividerHeight: 2,
              unselectedLabelColor: Color(0xff636F85),
              // isScrollable: true,
              unselectedLabelStyle: globalTextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              indicatorColor: AppColors.primary,
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.label,
              tabAlignment: TabAlignment.center,
              tabs: const [
                Tab(text: "Pending"),
                Tab(text: "Active"),
                Tab(text: "Completed"),
                Tab(text: "Cancelled"),
              ],
            ),

            // Tab View Expanded
            Expanded(
              child: TabBarView(
                controller: tabBarController.tabController,
                children: const [Pending(), Active(), Completed(), Cancelled()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
