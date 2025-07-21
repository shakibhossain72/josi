import 'package:get/get.dart';
import 'package:josi/features/sender/notification/model/notification_model.dart';

class NotificationController extends GetxController {
  final RxList<NotificationModel> _notifications = <NotificationModel>[].obs;
  final RxString _selectedTab = 'all'.obs;

  List<NotificationModel> get notifications => _notifications;
  String get selectedTab => _selectedTab.value;

  List<NotificationModel> get allNotifications => _notifications;

  List<NotificationModel> get unreadNotifications =>
      _notifications.where((notification) => !notification.isRead).toList();

  int get totalNotifications => _notifications.length;
  int get unreadCount => unreadNotifications.length;

  @override
  void onInit() {
    super.onInit();
    _loadNotifications();
  }

  void _loadNotifications() {
    // Simulate loading notifications
    _notifications.addAll([
      NotificationModel(
        id: '1',
        title: 'Service Reminder',
        message:
            'Your Doggy Daycare appointment is scheduled for tomorrow at 5:00 PM',
        createdAt: DateTime.now(),
        isRead: false,
        type: NotificationType.serviceReminder,
      ),
      NotificationModel(
        id: '2',
        title: 'Booking Confirmation',
        message:
            'Your booking is confirmed! We\'ll arrive on Time. Tap here for details',
        createdAt: DateTime.now(),
        isRead: false,
        type: NotificationType.bookingConfirmation,
      ),
      NotificationModel(
        id: '3',
        title: 'Service Provider on the Way',
        message:
            'Your dog is on the way to your location! Expected arrival on time.',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        isRead: true,
        type: NotificationType.serviceProvider,
      ),
      NotificationModel(
        id: '4',
        title: 'Payment Received',
        message:
            'Thank you! Your payment of \$20 for Boarding has been successfully processed.',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        isRead: true,
        type: NotificationType.paymentReceived,
      ),
    ]);
  }

  void selectTab(String tab) {
    _selectedTab.value = tab;
  }

  void markAsRead(String notificationId) {
    final index = _notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      _notifications[index] = _notifications[index].copyWith(isRead: true);
    }
  }

  void markAllAsRead() {
    for (int i = 0; i < _notifications.length; i++) {
      _notifications[i] = _notifications[i].copyWith(isRead: true);
    }
  }

  List<NotificationModel> getFilteredNotifications() {
    return _selectedTab.value == 'all' ? allNotifications : unreadNotifications;
  }

  String getNotificationIcon(NotificationType type) {
    switch (type) {
      case NotificationType.serviceReminder:
        return '🔔';
      case NotificationType.bookingConfirmation:
        return '✅';
      case NotificationType.serviceProvider:
        return '🚗';
      case NotificationType.paymentReceived:
        return '💳';
    }
  }

  String getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return 'Yesterday';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  bool isToday(DateTime dateTime) {
    final now = DateTime.now();
    return dateTime.day == now.day &&
        dateTime.month == now.month &&
        dateTime.year == now.year;
  }
}
