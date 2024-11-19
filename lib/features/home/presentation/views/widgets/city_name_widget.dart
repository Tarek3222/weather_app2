import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/core/themes/styles.dart';

class CityNameWidget extends StatelessWidget {
  const CityNameWidget({super.key, required this.cityName});
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Text(
      cityName,
      style: Styles.textStyleSemiBold40.copyWith(
        color: AppColors.myWhite,
      ),
    );
  }
}
