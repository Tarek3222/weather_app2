import 'package:flutter/material.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/presentation/views/widgets/build_custom_container.dart';
import 'package:weather_app/features/home/presentation/views/widgets/build_daily_forecast_list_view.dart';

class BuildDailyForecastWidget extends StatelessWidget {
  const BuildDailyForecastWidget({super.key, required this.weatherModel});
  final CurrentWeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return BuildCustomContainer(
      child: BuildDailyForecastListView(
        weatherModel: weatherModel,
      ),
    );
  }
}
