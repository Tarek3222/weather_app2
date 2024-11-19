import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/themes/app_colors.dart';

class BuildCustomDivider extends StatelessWidget {
  const BuildCustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 50.h,
      color: AppColors.myGrey,
      endIndent: 20.w,
      indent: 20.w,
      thickness: 0.1,
    );
  }
}
