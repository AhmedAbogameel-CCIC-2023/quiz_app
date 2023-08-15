import 'package:flutter/material.dart';
import 'package:quiz_app_g1/core/app_colors/app_colors.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.title,
    this.maxLines,
    this.color = AppColors.darkGray,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
  });

  final String title;
  final int? maxLines;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
