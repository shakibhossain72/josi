import 'package:flutter/material.dart';
import 'package:josi/core/common/widgets/custom_text.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/features/sender/home/presentation/model/upcomming_shipping_model.dart';

class UpcomingShippingCard extends StatelessWidget {
  final UpcomingShippingModel shipping;
  final VoidCallback onBookNow;

  const UpcomingShippingCard({
    super.key,
    required this.shipping,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with user info and flight icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Profile Image
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(shipping.senderImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: shipping.senderName,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          if (shipping.isVerified) ...[
                            SizedBox(width: 4),
                            Icon(Icons.verified, color: Colors.blue, size: 16),
                          ],
                        ],
                      ),
                      CustomText(
                        text: 'Verified by Admin',
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                ],
              ),
              // Flight icon
              Row(
                children: [
                  Icon(
                    Icons.flight_takeoff,
                    color: AppColors.textSecondary,
                    size: 20,
                  ),
                  SizedBox(width: 4),
                  CustomText(
                    text: 'Flight',
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 16),

          // Location details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: shipping.fromLocation,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      text: shipping.departureDate,
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomText(
                      text: shipping.toLocation,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      text: shipping.arrivalDate,
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 12),

          // Flight path line with dot
          Container(
            width: double.infinity,
            height: 2,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Stack(
              children: [
                Container(
                  height: 2,
                  width: double.infinity,
                  color: AppColors.textSecondary.withOpacity(0.3),
                ),
                Positioned(
                  right: 0,
                  top: -4,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: AppColors.textSecondary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          // Bottom section with details and booking
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side - Space and rating
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: 'Space: ',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(
                        text: shipping.space,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(width: 20),
                      CustomText(
                        text: 'Price: ',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(
                        text: shipping.price,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      SizedBox(width: 4),
                      CustomText(
                        text: '${shipping.rating}(${shipping.reviewCount})',
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                ],
              ),

              // Right side - Book Now button
              ElevatedButton(
                onPressed: onBookNow,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                ),
                child: CustomText(
                  text: 'Book Now',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
