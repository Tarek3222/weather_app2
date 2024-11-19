import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/constants/app_assets.dart';
import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/core/themes/styles.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Lottie.asset(Assets.imagesNoWeather, height: 250.h),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'No weather Avilable, Search Now !',
            style: Styles.textStyle16.copyWith(
              color: AppColors.myGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Or Click on the Location Button to get weather to your location',
            style: Styles.textStyle16.copyWith(
              color: AppColors.myGrey,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
