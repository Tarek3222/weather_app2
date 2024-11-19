import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/core/themes/styles.dart';
import 'package:weather_app/features/home/data/models/forecast_weather_model.dart';
import 'package:weather_app/features/home/presentation/views/widgets/build_hourly_forecast_list_view.dart';

class BuildItemForecastDaily extends StatelessWidget {
  const BuildItemForecastDaily({super.key, required this.forecastWeather});
  final ForecastWeatherModel forecastWeather;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      showTrailingIcon: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: buildDataOfDailyForcast(),
      children: [
        BuildHourlyForecastListView(
            listHourlyForecast: forecastWeather.hourlyForecast!),
      ],
    );
  }

  Widget buildDataOfDailyForcast() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            Jiffy.parse(forecastWeather.date.toString()).EEEE,
            style: Styles.textStyle12.copyWith(
              color: AppColors.myWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          children: [
            Image.network(
              'https:${forecastWeather.watherIcon}',
              width: 40.w,
            ),
            SizedBox(
              width: 40.w,
            ),
            Text(
              '${forecastWeather.maxTemp}°       ${forecastWeather.minTemp}°',
              style: Styles.textStyle12.copyWith(
                color: AppColors.myWhite,
              ),
            )
          ],
        ),
      ],
    );
  }
}
