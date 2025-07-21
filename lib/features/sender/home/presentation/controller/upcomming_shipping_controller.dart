import 'package:get/get.dart';
import 'package:josi/features/sender/home/presentation/model/upcomming_shipping_model.dart';

class UpcomingShippingController extends GetxController {
  // Observable list of upcoming shipping data
  var upcomingShippingList = <UpcomingShippingModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadUpcomingShippingData();
  }

  // Load sample data (in real app, this would be API call)
  void loadUpcomingShippingData() {
    isLoading.value = true;

    // Simulating API delay
    Future.delayed(Duration(milliseconds: 500), () {
      upcomingShippingList.value = [
        UpcomingShippingModel(
          id: '1',
          senderName: 'Rohit Khan',
          senderImage: 'assets/images/user_profile.png',
          isVerified: true,
          fromLocation: 'New York',
          toLocation: 'California, USA',
          departureDate: 'Aug 10, 2025',
          arrivalDate: 'Aug 14, 2025',
          space: '15kg',
          price: '\$10/kg',
          rating: 4.5,
          reviewCount: 120,
        ),
        UpcomingShippingModel(
          id: '2',
          senderName: 'Jhon Deo',
          senderImage: 'assets/images/user_profile.png',
          isVerified: true,
          fromLocation: 'New York',
          toLocation: 'California, USA',
          departureDate: 'Aug 10, 2025',
          arrivalDate: 'Aug 14, 2025',
          space: '15kg',
          price: '\$10/kg',
          rating: 4.5,
          reviewCount: 120,
        ),
      ];
      isLoading.value = false;
    });
  }

  // Method to book now
  void bookShipping(String shippingId) {
    // Implement booking logic
    Get.snackbar(
      'Booking Confirmed',
      'Your shipping has been booked successfully!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Method to refresh data
  void refreshData() {
    loadUpcomingShippingData();
  }
}
