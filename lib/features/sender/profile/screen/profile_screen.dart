import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/common/widgets/custom_appbar.dart';
import 'package:josi/core/common/widgets/custom_button.dart';
import 'package:josi/core/style/global_text_style.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/features/sender/profile/controller/profile_controller.dart';
import 'package:josi/features/sender/profile/screen/edit_profile_screen.dart';
import 'package:josi/features/sender/profile/screen/faq/screen/faq_screen.dart';
import 'package:josi/features/sender/profile/screen/faq/screen/notify_me_screen.dart';
import 'package:josi/features/sender/profile/screen/language_screen.dart';
import 'package:josi/features/sender/profile/screen/privacy_polict_screen.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              CustomAppbar(
                trailing: Container(),
                title: 'Profile',
                fontSize: 20,
                centerTitle: true,
              ),
              // Profile Header
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Column(
                  children: [
                    // Profile Avatar
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200],
                      ),
                      child: ClipOval(
                        child: Image.network(
                          'https://randomuser.me/api/portraits/men/76.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              decoration: BoxDecoration(shape: BoxShape.circle),
                            );
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    // User Name
                    Obx(
                      () => Text(
                        'Hi, ${controller.userName.value}',
                        style: globalTextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),

                    SizedBox(height: 4),

                    // User Email
                    Obx(
                      () => Text(
                        controller.userEmail.value,
                        style: globalTextStyle(
                          fontSize: 14,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              _buildSwitchMenuItem(
                title: 'Sender mode',
                switchValue: controller.notificationsEnabled,
                onSwitchChanged: (value) {
                  controller.toggleSenderMode(value);
                },
              ),

              SizedBox(height: 8),

              // Menu Items
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    _buildMenuItem(
                      icon: Icons.person_outline,
                      title: 'Edit profile',
                      onTap: () {
                        Get.to(() => EditProfileScreen());
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.person_outline,
                      title: 'Notify Me',
                      onTap: () {
                        Get.to(() => NotifyMeScreen());
                      },
                    ),

                    _buildDivider(),
                    _buildMenuItem(
                      icon: Icons.language_outlined,
                      title: 'Language',
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(
                            () => Text(
                              controller.selectedLanguage.value,
                              style: globalTextStyle(
                                fontSize: 14,
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.chevron_right,
                            color: AppColors.textPrimary,
                            size: 20,
                          ),
                        ],
                      ),
                      onTap: () {
                        // controller.changeLanguage();
                        Get.to(() => LanguageSelectionScreen());
                      },
                    ),
                    _buildDivider(),
                    _buildMenuItem(
                      icon: Icons.privacy_tip_outlined,
                      title: 'Privacy Policy',
                      onTap: () {
                        Get.to(() => PrivacyPolicyScreen());
                      },
                    ),
                    _buildDivider(),
                    _buildMenuItem(
                      icon: Icons.help_outline,
                      title: 'FAQ',
                      onTap: () {
                        Get.to(() => FAQScreen());
                      },
                    ),
                    _buildDivider(),
                    _buildMenuItem(
                      icon: Icons.logout,
                      title: 'Logout',
                      onTap: _showLogoutDialog,
                      showArrow: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              width: 40,
              height: 4,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Title
            Text(
              'Logout',
              style: globalTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 16),

            // Message
            Text(
              'Are you sure you want to log out?',
              style: globalTextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        Get.back(); // Close bottom sheet
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primary.withValues(
                          alpha: 0.1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: globalTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: CustomButton(
                      text: 'Yes, Logout',
                      onTap: () {
                        _performLogout();
                        Get.back();
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      isDismissible: true,
      enableDrag: true,
    );
  }

  void _performLogout() {
    if (kDebugMode) {
      print('User logged out');
    }
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Widget? trailing,
    bool showArrow = true,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Icon(icon, size: 24, color: AppColors.textSecondary),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: globalTextStyle(
                  fontSize: 16,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (trailing != null)
              trailing
            else if (showArrow)
              Icon(
                Icons.chevron_right,
                color: AppColors.textSecondary,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchMenuItem({
    required String title,
    required RxBool switchValue,
    required Function(bool) onSwitchChanged,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: globalTextStyle(
                  fontSize: 16,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Obx(
              () => Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: switchValue.value,
                  onChanged: onSwitchChanged,
                  activeColor: AppColors.white,
                  activeTrackColor: AppColors.primary,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey.withValues(alpha: 0.3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.only(left: 60),
      height: 1,
      color: Colors.grey[200],
    );
  }
}
