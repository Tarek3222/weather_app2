import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/features/home/data/models/hourly_forecast_model.dart';
import 'package:weather_app/features/home/presentation/views/widgets/custom_hourly_forcast_container.dart';

class BuildHourlyForecastListView extends StatelessWidget {
  const BuildHourlyForecastListView(
      {super.key, required this.listHourlyForecast});
  final List<HourlyForecastModel> listHourlyForecast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SizedBox(
        height: 125.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listHourlyForecast.length,
          itemBuilder: (_, index) {
            return CustomHourlyForcastContainer(
              hourlyForecast: listHourlyForecast[index],
            );
          },
        ),
      ),
    );
  }
}
