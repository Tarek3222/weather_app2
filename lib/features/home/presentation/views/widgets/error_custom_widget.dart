import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/constants/app_assets.dart';
import 'package:weather_app/core/themes/styles.dart';

class ErrorCustomWidget extends StatelessWidget {
  const ErrorCustomWidget({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70.h,
        ),
        AspectRatio(
          aspectRatio: 1.2,
          child: Lottie.asset(
            Assets.imagesError,
          ),
        ),
        Text(
          errorMessage,
          style: Styles.textStyle16.copyWith(
            color: Colors.red.shade600,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
