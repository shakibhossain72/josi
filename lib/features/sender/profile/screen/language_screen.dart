import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/features/sender/profile/controller/profile_controller.dart';

class LanguageSelectionScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Language',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Language Options
            ...controller.languages.map((language) {
              return Obx(
                () => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: LanguageOption(
                    code: language['code']!,
                    name: language['name']!,
                    flagAsset: language['flagAsset']!,
                    isSelected:
                        controller.selectedLanguage.value == language['code'],
                    onTap: () => controller.changeLanguage(language['code']!),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

// Language Option Widget
class LanguageOption extends StatelessWidget {
  final String code;
  final String name;
  final String flagAsset;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageOption({
    super.key,
    required this.code,
    required this.name,
    required this.flagAsset,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Flag Image
            Container(
              width: 32,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey.shade300, width: 0.5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3.5),
                child: Image.asset(
                  flagAsset,
                  width: 32,
                  height: 24,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback if image not found
                    return Container(
                      color: Colors.grey.shade200,
                      child: Icon(
                        Icons.flag,
                        size: 16,
                        color: Colors.grey.shade400,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Language Name
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
            ),
            // Selection Indicator
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.textSecondary,
                  width: 2,
                ),
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 12, color: Colors.white)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
