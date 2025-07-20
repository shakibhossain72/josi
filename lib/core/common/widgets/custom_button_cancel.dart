import 'package:flutter/material.dart';
import 'package:josi/core/utils/constants/app_sizer.dart';

import '../../utils/constants/app_colors.dart';
import 'custom_text.dart';


class CustomButtonCancel extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  const CustomButtonCancel({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.borderRadius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height ?? 37.h,
      color: backgroundColor ?? AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(50),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: CustomText(
          text: text,
          color: textColor ?? AppColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
