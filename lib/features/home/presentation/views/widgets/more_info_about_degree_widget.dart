import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/core/themes/styles.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';

class MoreInfoAboutDegreeWidget extends StatelessWidget {
  const MoreInfoAboutDegreeWidget({super.key, required this.weatherModel});
  final CurrentWeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Feels like',
                style: Styles.textStyle12,
              ),
              Text(
                ' ${weatherModel.feelslikeC}°C',
                style: Styles.textStyle12.copyWith(color: AppColors.myWhite),
              ),
              SizedBox(
                width: 50.w,
              ),
              Text(
                '|',
                style: Styles.textStyle12,
              ),
            ],
          ),
          buildWindAndHumidity(),
        ],
      ),
    );
  }

  Widget buildWindAndHumidity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Wind',
              style: Styles.textStyle12,
            ),
            Text(
              ' ${weatherModel.windSpeed} km/H',
              style: Styles.textStyle12.copyWith(color: AppColors.myWhite),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Humidity',
              style: Styles.textStyle12,
            ),
            Text(
              ' ${weatherModel.humidity}%',
              style: Styles.textStyle12.copyWith(color: AppColors.myWhite),
            ),
          ],
        ),
      ],
    );
  }
}
