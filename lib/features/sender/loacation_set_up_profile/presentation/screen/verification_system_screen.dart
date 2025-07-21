import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:josi/core/common/widgets/custom_button.dart';
import 'package:josi/core/common/widgets/custom_text.dart';
import 'package:josi/core/services/Auth_service.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import 'package:josi/features/sender/loacation_set_up_profile/presentation/controller/verification_system_controller.dart';
import 'package:josi/routes/app_routes.dart';
import '../../../../../core/common/widgets/custom_appbar.dart';
import '../../../../../core/style/global_text_style.dart';
import '../../../../../core/utils/constants/icon_path.dart';

class VerificationSystemScreen extends StatelessWidget {
   VerificationSystemScreen({super.key});

   final controller = Get.put(VerificationSystemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppbar(
                    title: 'Upload Documents',
                    centerTitle: true,
                    trailing: IconButton(
                        onPressed: () {
                          Get.back();
                        }, icon: Icon(Icons.arrow_back)),
                  ),
                  SizedBox(height: 24.h),
                  CustomText(text: 'Choose document type', fontSize: 18.sp,fontWeight: FontWeight.w500),
                  SizedBox(height: 16.sp),
                  Obx(() {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.items.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.9, // adjust as needed
                        ),
                          itemBuilder: (context, index) {
                            final item = controller.items[index];
                            return Obx(() {
                              final isSelected = controller.selectedIndex.value == index;
                              return GestureDetector(
                                onTap: () => controller.selectItem(index),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: isSelected ? AppColors.primary : Color(0xffEDEEF4),
                                      width: 2,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.camera_alt_outlined, size: 24),
                                      const SizedBox(height: 8),
                                      CustomText(
                                        text: item['title']!,
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.w500,
                                        color: isSelected ? AppColors.primary : AppColors.textPrimary,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                          }
            
                      ),
                    );
                  }),

                  // Image section
                  SizedBox(height: 16.h),
                  imageUploadBox(isFront: true),
                  imageUploadBox(isFront: false),
                  SizedBox(height: 16.h),
                  Obx(() {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: controller.isChecked.value,
                              onChanged: (bool? value) {
                                controller.isChecked.value = value ?? false;
                                controller.isCheckBoxError.value = false; // clear error on change
                              },
                              activeColor: AppColors.primary,
                            ),
                            Expanded(
                              child: CustomText(
                                text: 'I Confirm that I uploaded valid government-issued photo ID.',
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                        if (controller.isCheckBoxError.value)
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 4),
                            child: CustomText(
                              text: 'Please confirm before continuing.',
                              color: Colors.red,
                              fontSize: 11.sp,
                            ),
                          ),
                      ],
                    );
                  }),

                  SizedBox(height: 20.h),
                  CustomButton(
                      text: 'Continue',
                      onTap: (){
                        if(controller.validateCheckbox()){
                          _verifySuccessPopUp();
                        }
                      })
                ],
              ),
            ),
          )),
    );
  }


   Widget imageUploadBox({required bool isFront}) {
     final Rx<File?> image = isFront ? controller.frontImage : controller.backImage;
     return Obx(() {
       return Padding(
         padding: const EdgeInsets.only(bottom: 16),
         child: DottedBorder(
             options: RoundedRectDottedBorderOptions(
                     dashPattern: const [15, 5],
                     strokeWidth: 2,
                     radius: Radius.circular(25),
                     color: AppColors.textSecondary.withValues(alpha: 0.3),
                   ),
           child: Container(
             padding: EdgeInsets.all(10),
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(25),
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 if (image.value != null)
                   Stack(
                     children: [
                       ClipRRect(
                         borderRadius: BorderRadius.circular(12),
                         child: Image.file(
                           image.value!,
                           width: double.infinity,
                           height: 200,
                           fit: BoxFit.cover,
                         ),
                       ),
                       Positioned(
                         top: 8,
                         right: 8,
                         child: GestureDetector(
                           onTap: () => controller.removeImage(isFront: isFront),
                           child: Container(
                             padding: const EdgeInsets.all(4),
                             decoration: BoxDecoration(
                               color: Colors.black.withOpacity(0.6),
                               borderRadius: BorderRadius.circular(20),
                             ),
                             child: const Icon(
                               Icons.close,
                               color: Colors.white,
                               size: 20,
                             ),
                           ),
                         ),
                       ),
                     ],
                   )
                 else ...[
                   Icon(Icons.camera_alt_outlined, size: 36),
                   SizedBox(height: 8),
                   Text(
                     isFront ? "Front side of your document" : "Back side of your document",
                     style: globalTextStyle(
                       fontSize: 22.sp,
                       fontWeight: FontWeight.w600,
                       color: AppColors.textPrimary,
                     ),
                   ),
                   SizedBox(height: 8),
                   Text(
                     'Upload your document\nSupports: JPG, PNG',
                     textAlign: TextAlign.center,
                     style: globalTextStyle(
                       fontSize: 16.sp,
                       fontWeight: FontWeight.w500,
                       color: AppColors.textSecondary,
                     ),
                   ),
                   SizedBox(height: 32),
                   Row(
                     children: [
                       Expanded(
                         child: OutlinedButton(
                           onPressed: () => controller.pickImage(isFront: isFront, source: ImageSource.camera),
                           child: CustomText(text: 'Camera', fontSize: 14.sp,fontWeight: FontWeight.w400),
                         ),
                       ),
                       SizedBox(width: 16),
                       Expanded(
                         child: OutlinedButton(
                           onPressed: () => controller.pickImage(isFront: isFront, source: ImageSource.gallery),
                           child: CustomText(text: 'Choose a file', fontSize: 14.sp,fontWeight: FontWeight.w400),
                         ),
                       ),
                     ],
                   ),
                 ],
               ],
             ),
           ),
         ),
       );
     });
   }

   void _verifySuccessPopUp() {
     showDialog(
       context: Get.context!, // Or pass context if you're not using GetX
       builder: (context) {
         return AlertDialog(
           backgroundColor: AppColors.white,
           content: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               Image.asset(IconPath.verifyIcon, height: 120.h),
               SizedBox(height: 24.h),
               CustomText(text: 'Account  verified Successfully',textAlign: TextAlign.center,fontSize: 20.sp,fontWeight: FontWeight.w600),
               SizedBox(height: 24.h),
               CustomButton(
                 text: 'Done',
                 onTap: () {
                  if(AuthService.userRole == 'SENDER'){
                    Get.toNamed(AppRoute.navBar);
                  }else{
                    Get.toNamed(AppRoute.travelerNavBar);
                  }
                 },
               ),
             ],
           ),
         );
       },
     );
   }


}
