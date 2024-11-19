import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:weather_app/core/themes/styles.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';

class LastUpdatedWidget extends StatelessWidget {
  const LastUpdatedWidget({super.key, required this.weatherModel});
  final CurrentWeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 108),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xff32333E),
        borderRadius: BorderRadius.circular(24),
      ),
      child: buildTime(),
    );
  }

  Widget buildTime() {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        '${Jiffy.now().yMMMMd} at ${weatherModel.lastUpdated!.hour}:${weatherModel.lastUpdated!.minute}',
        style: Styles.textStyle12,
      ),
    );
  }
}
