import 'package:flutter/material.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/presentation/views/widgets/build_custom_divider.dart';
import 'package:weather_app/features/home/presentation/views/widgets/city_name_widget.dart';
import 'package:weather_app/features/home/presentation/views/widgets/degree_and_status_weather_widget.dart';
import 'package:weather_app/features/home/presentation/views/widgets/more_info_about_degree_widget.dart';

class WeatherInformationSection extends StatelessWidget {
  const WeatherInformationSection({super.key, required this.weatherModel});
  final CurrentWeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CityNameWidget(
          cityName: weatherModel.name ?? 'city not found',
        ),
        DegreeAndStatusWeatherWidget(
          weatherModel: weatherModel,
        ),
        const SizedBox(height: 20),
        MoreInfoAboutDegreeWidget(
          weatherModel: weatherModel,
        ),
        const BuildCustomDivider(),
      ],
    );
  }
}
