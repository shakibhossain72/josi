import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/common/widgets/custom_appbar.dart';
import 'package:josi/core/style/global_text_style.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import 'package:josi/features/sender/notification/controller/notification_controller.dart';
import 'package:josi/features/sender/notification/model/notification_model.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: Column(
          children: [
            // Tab Bar
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
                title: 'Notifications',
                centerTitle: true,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: _buildTabButton(
                        controller,
                        'all',
                        'All (${controller.totalNotifications})',
                        controller.selectedTab == 'all',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildTabButton(
                        controller,
                        'unread',
                        'Unread (${controller.unreadCount})',
                        controller.selectedTab == 'unread',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Notification List
            Expanded(
              child: Obx(() {
                final notifications = controller.getFilteredNotifications();

                if (notifications.isEmpty) {
                  return const Center(
                    child: Text(
                      'No notifications',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];
                    final isFirst = index == 0;
                    final isToday = controller.isToday(notification.createdAt);
                    final previousNotification = index > 0
                        ? notifications[index - 1]
                        : null;
                    final shouldShowDateHeader =
                        isFirst ||
                        (previousNotification != null &&
                            controller.isToday(
                                  previousNotification.createdAt,
                                ) !=
                                isToday);

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (shouldShowDateHeader)
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 12,
                              top: index == 0 ? 0 : 24,
                            ),
                            child: Text(
                              isToday ? 'Today' : 'Yesterday',
                              style: globalTextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        _buildNotificationCard(notification, controller),
                        const SizedBox(height: 12),
                      ],
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(
    NotificationController controller,
    String tabValue,
    String text,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () => controller.selectTab(tabValue),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: isSelected ? null : Border.all(color: Colors.grey[300]!),
        ),
        child: Center(
          child: Text(
            text,
            style: globalTextStyle(
              color: isSelected ? Colors.white : AppColors.textSecondary,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationCard(
    NotificationModel notification,
    NotificationController controller,
  ) {
    return GestureDetector(
      onTap: () {
        if (!notification.isRead) {
          controller.markAsRead(notification.id);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notification Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  controller.getNotificationIcon(notification.type),
                  style: globalTextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Notification Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: globalTextStyle(
                      fontSize: 16,
                      fontWeight: notification.isRead
                          ? FontWeight.w500
                          : FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification.message,
                    style: globalTextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            // Unread Indicator
            if (!notification.isRead)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
