import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/app_colors.dart';

class CustomRichText extends StatelessWidget {
  final String normalText;
  final String tappableText;
  final VoidCallback? onTap;
  final double? fontSize;

  const CustomRichText({
    super.key,
    required this.normalText,
    required this.tappableText,
    this.onTap,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: normalText,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: fontSize,
          ),
          children: [
            TextSpan(
              text: tappableText,
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
