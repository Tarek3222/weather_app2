import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:weather_app/core/themes/app_colors.dart';

Widget customRefreshIndecator(
    {required Future<void> Function() onRefresh, required Widget child}) {
  return LiquidPullToRefresh(
    onRefresh: onRefresh,
    color: AppColors.myGrey.withOpacity(0.5),
    backgroundColor: AppColors.myWhite,
    height: 150.h,
    showChildOpacityTransition: false,
    animSpeedFactor: 2,
    child: child,
  );
}
