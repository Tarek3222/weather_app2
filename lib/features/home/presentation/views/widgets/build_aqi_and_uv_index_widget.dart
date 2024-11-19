import 'package:flutter/material.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/presentation/views/widgets/build_custom_container.dart';
import 'package:weather_app/features/home/presentation/views/widgets/custom_list_tile.dart';

class BuildAqiAndUvIndexWidget extends StatelessWidget {
  const BuildAqiAndUvIndexWidget({super.key, required this.weatherModel});
  final CurrentWeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    String uvIndex = getStateOfUvIndex(weatherModel.uv!);
    String aqi = getStateOfAqi(weatherModel.airQuality!);
    return BuildCustomContainer(
      child: Column(
        children: [
          CustomListTile(
            title: 'AQI',
            subtitle: '$aqi ${weatherModel.airQuality!}',
            icon: Icons.air,
          ),
          CustomListTile(
            title: 'UV Index',
            subtitle: '$uvIndex ${weatherModel.uv!}',
            icon: Icons.wb_sunny,
          ),
        ],
      ),
    );
  }

  String getStateOfUvIndex(num uvIndex) {
    if (uvIndex <= 2) {
      return 'Low';
    } else if (uvIndex <= 5) {
      return 'Moderate';
    } else if (uvIndex <= 7) {
      return 'High';
    } else {
      return 'Very High';
    }
  }

  String getStateOfAqi(num aqi) {
    if (aqi <= 50) {
      return 'Good';
    } else if (aqi <= 100) {
      return 'Fair';
    } else if (aqi <= 150) {
      return 'Moderate';
    } else if (aqi <= 200) {
      return 'Poor';
    } else if (aqi <= 300) {
      return 'Very Poor';
    } else {
      return 'Severe';
    }
  }
}
