import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/common/widgets/custom_text.dart';
import 'package:josi/core/common/widgets/custom_textformfield.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import 'package:josi/core/utils/constants/icon_path.dart';
import 'package:josi/features/sender/home/presentation/controller/filter_controller.dart';

class FilterBottomSheet extends StatelessWidget {
  FilterBottomSheet({super.key});

  final FilterController filterController = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: CustomText(
                    text: 'Filter Traveler',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.close,
                    color: AppColors.textSecondary,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // From Section
                  // _buildSectionTitle('From'),
                  CustomText(text: 'From'),
                  SizedBox(height: 8),

                  CustomTextField(
                    controller: TextEditingController(),
                    hintText: 'Location',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        IconPath.location,
                        height: 14,
                        width: 14,
                      ),
                    ),
                  ),

                  SizedBox(height: 24),

                  // To Section
                  CustomText(text: 'To'),
                  SizedBox(height: 8),
                  CustomTextField(
                    controller: TextEditingController(),
                    hintText: 'Location',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        IconPath.location,
                        height: 14,
                        width: 14,
                      ),
                    ),
                  ),

                  SizedBox(height: 24),

                  // Date Select Section
                  CustomText(text: 'Date Select'),

                  SizedBox(height: 8),
                  _buildDateSelector(context),

                  SizedBox(height: 24),

                  // Weight Section
                  CustomText(text: 'Kg'),

                  SizedBox(height: 8),
                  _buildWeightSelector(),

                  Spacer(),

                  // Apply Button
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 30),
                    child: ElevatedButton(
                      onPressed: filterController.applyFilter,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.textPrimary,
                        foregroundColor: AppColors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: CustomText(
                        text: 'Apply Filter',
                        color: AppColors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () => filterController.selectDate(context),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Color(0xFFE0E0E0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: filterController.formattedDate,
                fontSize: 14.sp,
                color: filterController.selectedDate.value == null
                    ? AppColors.textSecondary
                    : AppColors.textPrimary,
              ),
              Icon(
                Icons.calendar_today_outlined,
                color: AppColors.textSecondary,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeightSelector() {
    return Obx(
      () => Row(
        children: filterController.weightOptions.map((weight) {
          bool isSelected = filterController.selectedWeight.value == weight;
          return Expanded(
            child: GestureDetector(
              onTap: () => filterController.setSelectedWeight(weight),
              child: Container(
                margin: EdgeInsets.only(right: weight == 25 ? 0 : 8),
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.textPrimary : Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.textPrimary
                        : Color(0xFFE0E0E0),
                  ),
                ),
                child: Center(
                  child: CustomText(
                    text: weight.toString(),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? AppColors.white : AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
