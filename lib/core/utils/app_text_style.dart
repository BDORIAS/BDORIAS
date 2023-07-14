import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';
import '../constants/app_string.dart';

class AppTextStyle with Diagnosticable {
  static TextStyle? BlinkerSemiBoldWhite({required double fontSize}) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
        fontFamily: AppStrings.fontFamilyBlinker,
      );
  static TextStyle? BlinkerRegularWhite({required double fontSize}) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
        fontFamily: AppStrings.fontFamilyBlinker,
      );
  static TextStyle? SignikaRegularWhite({required double fontSize}) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
        fontFamily: AppStrings.fontFamilySignika,
      );
  static TextStyle? BlinkerBoldWhite({required double fontSize}) => TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
        fontFamily: AppStrings.fontFamilyBlinker,
      );
  static TextStyle? BlinkerRegular(
          {required double fontSize, required Color color}) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color,
        fontFamily: AppStrings.fontFamilyBlinker,
      );
  static TextStyle? labelTextFormField = TextStyle(
    fontSize: AppFontSize.s16,
    color: AppColors.textPrimary,
    fontFamily: AppStrings.fontFamilySignika,
  );
}
