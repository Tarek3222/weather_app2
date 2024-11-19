import 'package:flutter/material.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/presentation/views/widgets/build_item_forecast_daily.dart';
import 'package:weather_app/features/home/presentation/views/widgets/high_and_low_text_widget.dart';

class BuildDailyForecastListView extends StatelessWidget {
  const BuildDailyForecastListView({super.key, required this.weatherModel});
  final CurrentWeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: weatherModel.forecastWeather!.length + 1,
      itemBuilder: (_, index) {
        return index == 0
            ? const HighAndLowTextWidget()
            : BuildItemForecastDaily(
                forecastWeather: weatherModel.forecastWeather![index - 1],
              );
      },
    );
  }
}
