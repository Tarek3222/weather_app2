import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/themes/app_colors.dart';

abstract class Styles {
  static TextStyle textStyleSemiBold40 = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.onBoardingPrimaryColor,
  );
  static TextStyle textStyleSemiBold60 = TextStyle(
    fontSize: 60.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.myGrey,
  );
  static TextStyle textStyle24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.myGrey,
  );
  static TextStyle textStyle28 = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.onBoardingPrimaryColor,
  );
  static TextStyle textStyle16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.myGrey,
  );
  static TextStyle textStyle14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.myWhite,
  );

  static TextStyle textStyle12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xff9B9EAD),
  );
}
