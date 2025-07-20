import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';
import 'custom_text.dart';

class OutlineBookButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color borderColor;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;
  final FontWeight fontWeight;

  const OutlineBookButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.borderColor = AppColors.primary,
    this.textColor = AppColors.primary,
    this.width = 200,
    this.height = 37,
    this.borderRadius = 50,
    this.fontWeight = FontWeight.w600,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(width, height),
        side: BorderSide(color: borderColor, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        foregroundColor: textColor,
        backgroundColor: Colors.transparent,
      ),
      onPressed: onPressed,
      child: CustomText(
        text: text,
        color: textColor,
        fontWeight: fontWeight,
      ),
    );
  }
}
