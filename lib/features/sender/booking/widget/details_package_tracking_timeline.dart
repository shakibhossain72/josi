import 'package:flutter/material.dart';
import 'package:josi/core/style/global_text_style.dart';
import 'package:josi/core/utils/constants/app_colors.dart';

class PackageTrackingTimeline extends StatelessWidget {
  const PackageTrackingTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Text(
                'Tracking Package',
                style: globalTextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              Text(
                'Jan 10, 2023',
                style: globalTextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Timeline
          Column(
            children: [
              _buildTimelineItem(
                date: 'Jan 10, 2025, 10:15 AM, New York',
                status: 'Picked',
                isActive: true,
                isCompleted: true,
                isFirst: true,
              ),
              _buildTimelineItem(
                date: 'Jan 10, 2025, 10:15 AM, Fly Plan',
                status: 'In Transit',
                isActive: false,
                isCompleted: true,
                isFirst: false,
              ),
              _buildTimelineItem(
                date: 'Jan 13, 2025, 03:00 PM, California',
                status: 'Out For Delivery',
                isActive: false,
                isCompleted: false,
                isFirst: false,
              ),
              _buildTimelineItem(
                date: 'Jan 14, 2025, 06:00 PM, California',
                status: 'Package Delivered',
                isActive: false,
                isCompleted: false,
                isFirst: false,
                isLast: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required String date,
    required String status,
    required bool isActive,
    required bool isCompleted,
    required bool isFirst,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator column
          Column(
            children: [
              // Circle indicator
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                ),
              ),
              // Vertical line (only if not last item)
              if (!isLast)
                Container(
                  width: 2,
                  height: 60,
                  color: isCompleted
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                ),
            ],
          ),
          const SizedBox(width: 16),

          // Content column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date and location
                Text(
                  date,
                  style: globalTextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),

                // Status
                Text(
                  status,
                  style: globalTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isCompleted
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                  ),
                ),

                // Bottom spacing (except for last item)
                if (!isLast) const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Usage example in a Scaffold
class PackageTrackingScreen extends StatelessWidget {
  const PackageTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: PackageTrackingTimeline(),
        ),
      ),
    );
  }
}
