import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/common/widgets/custom_appbar.dart';
import 'package:josi/core/style/global_text_style.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import 'package:josi/core/utils/constants/icon_path.dart';
import 'package:josi/features/sender/profile/controller/profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: CustomAppbar(
                  trailing: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFFFFF),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                  title: 'Edit Profile',
                  fontSize: 20.sp,
                  centerTitle: true,
                ),
              ),

              // ),
              Obx(() {
                return Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        backgroundImage:
                            profileController.profileImage.value != null
                            ? FileImage(profileController.profileImage.value!)
                            : null,
                        child: profileController.profileImage.value == null
                            ? Image.asset(IconPath.profileIcon)
                            : null,
                      ),

                      // Positioned(
                      //   bottom: 0,
                      //   right: 0,
                      //   child: GestureDetector(
                      //     onTap: profileController.pickImage,
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //         shape: BoxShape.circle,
                      //         color: AppColors.primary,
                      //         border: Border.all(color: Colors.white, width: 3),
                      //       ),
                      //       child: Padding(
                      //         padding: EdgeInsets.all(6.0),

                      //         child: Image.asset(
                      //           '',
                      //           // IconPath.editIcon,
                      //           height: 12,
                      //           width: 12,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                );
              }),

              SizedBox(height: 20),
              Text(
                'Full Name',
                style: globalTextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,

                    hintText: 'Enter your full name',
                    hintStyle: globalTextStyle(color: AppColors.textSecondary),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),
              Text(
                'Phone',
                style: globalTextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,

                    // labelText: 'Phone',
                    hintText: '603.555.0123',
                    hintStyle: globalTextStyle(color: AppColors.textSecondary),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Email',
                style: globalTextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    // labelText: 'Email',
                    hintText: 'robertcary@mail.com',
                    hintStyle: globalTextStyle(color: AppColors.textSecondary),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
