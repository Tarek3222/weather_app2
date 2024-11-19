import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/core/themes/styles.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';

class DegreeAndStatusWeatherWidget extends StatelessWidget {
  const DegreeAndStatusWeatherWidget({super.key, required this.weatherModel});
  final CurrentWeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: 35.w),
              Image.network(
                'https:${weatherModel.weatherIcon!}',
              ),
            ],
          ),
          Column(
            children: [
              buildDegreeOfWeather(),
              Text(
                weatherModel.weatherState ?? 'not state',
                style: Styles.textStyle12.copyWith(
                  color: AppColors.myWhite,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDegreeOfWeather() {
    return Row(
      children: [
        Text(
          '${weatherModel.tempC}',
          style: Styles.textStyleSemiBold60,
        ),
        Text(
          '°',
          style: Styles.textStyleSemiBold40.copyWith(
            color: AppColors.myGrey,
          ),
        ),
      ],
    );
  }
}
