import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/common/widgets/custom_appbar.dart';
import 'package:josi/core/common/widgets/custom_button.dart';
import 'package:josi/core/common/widgets/custom_text.dart';
import 'package:josi/core/common/widgets/custom_textformfield.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import 'package:josi/features/sender/home/presentation/model/upcomming_shipping_model.dart';
import 'package:josi/features/sender/home/send_package/send_pacjage.dart';
import 'package:josi/features/sender/home/traveler_details_screen/controller/traveler_details_controller.dart';

class TravelerDetailsScreen extends StatelessWidget {
  final UpcomingShippingModel? shipping;
  final VoidCallback? onBookNow;
  TravelerDetailsScreen({super.key, this.shipping, this.onBookNow});
  final TravelerDetailsController controller = Get.put(
    TravelerDetailsController(),
  );
  final RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    // Initialize the controller

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(
                  trailing: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  title: 'Traveler Details',
                  centerTitle: true,
                  fontSize: 20.sp,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header with user info and flight icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              // Profile Image
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      shipping?.senderImage ?? '',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        text: shipping?.senderName ?? '',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      if (shipping?.isVerified ?? false) ...[
                                        SizedBox(width: 4),
                                        Icon(
                                          Icons.verified,
                                          color: Colors.grey,
                                          size: 16,
                                        ),
                                      ],
                                    ],
                                  ),
                                  CustomText(
                                    text: 'Verified by Admin',
                                    fontSize: 12,
                                    color: AppColors.textSecondary,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Flight icon
                          Row(
                            children: [
                              Icon(
                                Icons.flight_takeoff,
                                color: AppColors.textSecondary,
                                size: 20,
                              ),
                              SizedBox(width: 4),
                              CustomText(
                                text: 'Flight',
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 16),

                      // Location details
                      Container(
                        // width: 200,
                        height: 95,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.textPrimary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CustomText(
                                      text: 'From',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                    CustomText(
                                      text: shipping?.fromLocation ?? '',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: CircleAvatar(
                                        radius: 4,
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(1.0),

                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.20,

                                    child: DottedLine(
                                      direction: Axis.horizontal,
                                      lineLength: double.infinity,
                                      lineThickness: 2.0,
                                      dashLength: 4.0,
                                      dashColor: Colors.grey[400]!,
                                      dashRadius: 0.0,
                                      dashGapLength: 4.0,
                                      dashGapColor: Colors.transparent,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: CircleAvatar(
                                        radius: 4,
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8.0),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: 'To',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                    CustomText(
                                      text: shipping?.toLocation ?? '',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFFFFFFF),
                                      textOverflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 16),

                      // Bottom section with details and booking
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                    text: 'Space: ',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  CustomText(
                                    text: shipping?.space ?? '',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  CustomText(
                                    text: 'Price: ',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  CustomText(
                                    text: shipping?.price ?? '',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),

                              // SizedBox(width: 20),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 16),
                              SizedBox(width: 4),
                              CustomText(
                                text:
                                    '${shipping?.rating}(${shipping?.reviewCount})',
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "About",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 12),
                    CustomText(
                      text: shipping?.about ?? '',
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(height: 24),

                    // Shipment Type Bottom Sheet
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Shipment Type",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 8),
                        Obx(
                          () => GestureDetector(
                            onTap: () => _showShipmentTypeBottomSheet(
                              context,
                              controller,
                            ),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text:
                                        controller
                                            .selectedShipmentType
                                            .value
                                            .isEmpty
                                        ? 'Select'
                                        : controller.selectedShipmentType.value,
                                    fontSize: 14,
                                    color:
                                        controller
                                            .selectedShipmentType
                                            .value
                                            .isEmpty
                                        ? Colors.grey
                                        : Colors.black,
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16),

                    // Package Size Bottom Sheet
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Package Size",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 8),
                        Obx(
                          () => GestureDetector(
                            onTap: () => _showPackageSizeBottomSheet(
                              context,
                              controller,
                            ),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text:
                                        controller
                                            .selectedPackageSize
                                            .value
                                            .isEmpty
                                        ? 'Select'
                                        : controller.selectedPackageSize.value,
                                    fontSize: 14,
                                    color:
                                        controller
                                            .selectedPackageSize
                                            .value
                                            .isEmpty
                                        ? Colors.grey
                                        : Colors.black,
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Sender Information',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 10.h),

                        CustomText(
                          text: 'Name',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 4.h),
                        CustomTextField(
                          controller: TextEditingController(),
                          fillColor: Color(0xFFFFFFFF),
                          hintText: 'Enter your name',
                        ),

                        SizedBox(height: 10.h),

                        CustomText(
                          text: 'Phone',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 4.h),
                        CustomTextField(
                          controller: TextEditingController(),
                          fillColor: Color(0xFFFFFFFF),
                          hintText: '(219) 555-0114',
                        ),

                        SizedBox(height: 10.h),

                        CustomText(
                          text: 'Address',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 4.h),
                        CustomTextField(
                          controller: TextEditingController(),
                          fillColor: Color(0xFFFFFFFF),
                          hintText: 'Write your address',
                        ),
                        SizedBox(height: 10.h),

                        CustomText(
                          text: 'Pickup Date',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 4.h),
                        CustomTextField(
                          controller: TextEditingController(),
                          fillColor: Color(0xFFFFFFFF),
                          hintText: 'Select Date',
                          suffixIcon: Icon(Icons.calendar_month_outlined),
                        ),

                        SizedBox(height: 10.h),

                        CustomText(
                          text: 'Pickup Time',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 4.h),
                        CustomTextField(
                          controller: TextEditingController(),
                          fillColor: Color(0xFFFFFFFF),
                          hintText: 'Select Date',
                          suffixIcon: Icon(Icons.watch_later_outlined),
                        ),

                        SizedBox(height: 10.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Delivery Type",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 8),
                            Obx(
                              () => GestureDetector(
                                onTap: () => _showDeliveryTypeBottomSheet(
                                  context,
                                  controller,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text:
                                            controller
                                                .selectedDeliveryType
                                                .value
                                                .isEmpty
                                            ? 'Select'
                                            : controller
                                                  .selectedDeliveryType
                                                  .value,
                                        fontSize: 14,
                                        color:
                                            controller
                                                .selectedDeliveryType
                                                .value
                                                .isEmpty
                                            ? Colors.grey
                                            : Colors.black,
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 10.h),

                        CustomText(
                          text: 'Notes',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 10.h),
                        TextField(
                          // controller: notesController,
                          maxLines: null,
                          minLines: 3,
                          decoration: InputDecoration(
                            hintText: 'Write your notes here...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.grey.shade200,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ],
                ),
                CustomButton(
                  text: "Next",
                  onTap: () {
                    Get.to(() => Sentpackage());
                  },
                ),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showShipmentTypeBottomSheet(
    BuildContext context,
    TravelerDetailsController controller,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Header
              Padding(
                padding: EdgeInsets.all(16),
                child: CustomText(
                  text: "Shipment Type",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              // Options List
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.shipmentTypes.length,
                  itemBuilder: (context, index) {
                    final type = controller.shipmentTypes[index];
                    return Obx(
                      () => ListTile(
                        leading: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color:
                                  controller.selectedShipmentType.value == type
                                  ? AppColors.textPrimary
                                  : Colors.grey,
                              width: 2,
                            ),
                            color: controller.selectedShipmentType.value == type
                                ? AppColors.textPrimary
                                : Colors.transparent,
                          ),
                          child: controller.selectedShipmentType.value == type
                              ? Icon(Icons.check, size: 14, color: Colors.white)
                              : null,
                        ),
                        title: CustomText(
                          text: type,
                          fontSize: 16,
                          fontWeight:
                              controller.selectedShipmentType.value == type
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                        onTap: () {
                          controller.setShipmentType(type);
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  void _showDeliveryTypeBottomSheet(
    BuildContext context,
    TravelerDetailsController controller,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Header
              Padding(
                padding: EdgeInsets.all(16),
                child: CustomText(
                  text: "Delivery Type",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              // Options List
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.deliveryTypes.length,
                  itemBuilder: (context, index) {
                    final type = controller.deliveryTypes[index];
                    return Obx(
                      () => ListTile(
                        leading: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color:
                                  controller.selectedDeliveryType.value == type
                                  ? AppColors.textPrimary
                                  : Colors.grey,
                              width: 2,
                            ),
                            color: controller.selectedDeliveryType.value == type
                                ? AppColors.textPrimary
                                : Colors.transparent,
                          ),
                          child: controller.selectedDeliveryType.value == type
                              ? Icon(Icons.check, size: 14, color: Colors.white)
                              : null,
                        ),
                        title: CustomText(
                          text: type,
                          fontSize: 16,
                          fontWeight:
                              controller.selectedDeliveryType.value == type
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                        onTap: () {
                          controller.setDeliveryType(type);
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  void _showPackageSizeBottomSheet(
    BuildContext context,
    TravelerDetailsController controller,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Header
              Padding(
                padding: EdgeInsets.all(16),
                child: CustomText(
                  text: "Package Size",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              // Options Grid (3kg layout like in image)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: controller.packageSizes.length,
                  itemBuilder: (context, index) {
                    final size = controller.packageSizes[index];
                    return Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.setPackageSize(size);
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:
                                  controller.selectedPackageSize.value == size
                                  ? AppColors.textPrimary
                                  : Colors.grey[300]!,
                              width:
                                  controller.selectedPackageSize.value == size
                                  ? 2
                                  : 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: controller.selectedPackageSize.value == size
                                ? AppColors.textPrimary.withValues(alpha: 0.1)
                                : Colors.white,
                          ),
                          child: Center(
                            child: CustomText(
                              text: size,
                              fontSize: 14,
                              fontWeight:
                                  controller.selectedPackageSize.value == size
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                              color:
                                  controller.selectedPackageSize.value == size
                                  ? AppColors.textPrimary
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }
}
