import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/themes/app_colors.dart';

class BuildContainerToContinue extends StatelessWidget {
  const BuildContainerToContinue({super.key, this.onTap, required this.child});
  final void Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 60.h,
        height: 60.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor,
              AppColors.sceondaryColor,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
