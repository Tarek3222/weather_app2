import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/widgets/custom_refresh_indecator.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/presentation/view_model/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:weather_app/features/home/presentation/views/widgets/weather_info_body.dart';

class WeatherInfoBodyWithRefreshIndecator extends StatelessWidget {
  const WeatherInfoBodyWithRefreshIndecator(
      {super.key, required this.weatherModel});
  final CurrentWeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return customRefreshIndecator(
      onRefresh: () => context.read<GetCurrentWeatherCubit>().getCurrentWeather(
            city: weatherModel.name ?? 'cairo',
          ),
      child: WeatherInfoBody(
        weatherModel: weatherModel,
      ),
    );
  }
}
