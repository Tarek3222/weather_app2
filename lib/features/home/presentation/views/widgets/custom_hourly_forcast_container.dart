import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/core/themes/styles.dart';
import 'package:weather_app/features/home/data/models/hourly_forecast_model.dart';

class CustomHourlyForcastContainer extends StatelessWidget {
  const CustomHourlyForcastContainer({super.key, required this.hourlyForecast});
  final HourlyForecastModel hourlyForecast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xff000000).withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: buildDataOfHourlyForcast(),
    );
  }

  Widget buildDataOfHourlyForcast() {
    return Column(
      children: [
        Text(
          '${hourlyForecast.time!.hour}:${hourlyForecast.time!.minute}',
          style: Styles.textStyle12,
        ),
        const SizedBox(
          height: 10,
        ),
        Image.network(
          'https:${hourlyForecast.icon!}',
          width: 40.w,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '${hourlyForecast.temp}°',
          style: Styles.textStyle12.copyWith(
            color: AppColors.myWhite,
          ),
        ),
      ],
    );
  }
}
