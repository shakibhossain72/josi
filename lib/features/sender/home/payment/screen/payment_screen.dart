import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/common/widgets/custom_appbar.dart';
import 'package:josi/core/common/widgets/custom_button.dart';
import 'package:josi/core/style/global_text_style.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';
import 'package:josi/core/utils/constants/icon_path.dart';
import 'package:josi/features/sender/home/payment/controller/payment_controller.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  final PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
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
                title: 'Choose Payment',
                fontSize: 20.sp,
                centerTitle: true,
              ),
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Payment Method Header with Add New Card
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment Method',
                          style: globalTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 24),

                    // Payment Methods List
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // PayPal
                        _buildPaymentOption(
                          'PayPal',
                          IconPath.paypalIcon,
                          // IconsPath.paypalIcon,
                          'PayPal',
                          isSelected: true, // Default selection
                        ),

                        SizedBox(height: 16),

                        // Square
                        _buildPaymentOption(
                          'Stripe',
                          IconPath.stripeIcon,
                          'Stripe',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Fixed Bottom Button
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, -1),
                  ),
                ],
              ),
              child: CustomButton(
                text: "Pay",
                onTap: () {
                  _processPayment();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(
    String title,
    String iconPath,
    String value, {
    bool isSelected = false,
  }) {
    return Obx(() {
      final selected =
          controller.selectedPaymentMethod.value == value ||
          (controller.selectedPaymentMethod.value == '' && isSelected);

      return GestureDetector(
        onTap: () {
          controller.selectPaymentMethod(value);
        },
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected ? Color(0xFFFF6B35) : Colors.grey[300]!,
              width: selected ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.05),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              // Payment Icon
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  iconPath,
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(width: 16),

              // Payment Method Name
              Expanded(
                child: Text(
                  title,
                  style: globalTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),

              // Selection Radio Button
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selected ? Color(0xFFFF6B35) : Colors.grey[400]!,
                    width: 2,
                  ),
                ),
                child: selected
                    ? Container(
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFF6B35),
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      );
    });
  }

  void _processPayment() {
    if (controller.selectedPaymentMethod.value.isEmpty) {
      Get.snackbar(
        'Payment Method Required',
        'Please select a payment method to continue.',
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    // Show loading and process payment
    Get.dialog(
      Center(
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(color: Color(0xFFFF6B35)),
              SizedBox(height: 16),
              Text(
                'Processing Payment...',
                style: globalTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );

    // Simulate payment processing
    Future.delayed(Duration(seconds: 2), () {
      Get.back(); // Close loading dialog
      _showPaymentSuccess();
    });
  }

  void _showPaymentSuccess() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success Icon with dotted border
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(child: Image.asset(IconPath.paymentSuccessIcon)),
              ),
            ),

            // Size indicator
            SizedBox(height: 24),

            // Greeting text
            Text(
              'Hi, Jhon Smith',
              style: globalTextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 8),

            // Success message
            Text(
              'Your payment has been\nsuccessfully done.',
              textAlign: TextAlign.center,
              style: globalTextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),

            SizedBox(height: 24),

            // Connect message
            Text(
              'Let\'s connect with Rohit and\ncontinue your chats',
              textAlign: TextAlign.center,
              style: globalTextStyle(fontSize: 16, color: Colors.black87),
            ),

            SizedBox(height: 20),

            // Profile images row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // First user image
                SizedBox(
                  width: 85, // Total width for both overlapping circles
                  height: 50,
                  child: Stack(
                    children: [
                      // First user image (behind)
                      Positioned(
                        left: 0,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              'assets/images/user_profile.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // Second user image (in front, overlapping)
                      Positioned(
                        left: 35, // 50 - 15 = 35 for 15px overlap
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              'assets/images/user_profile.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 32),

            // Chat button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.back(); // Close dialog
                  Get.until((route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Chats',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: true,
    );
  }
}
