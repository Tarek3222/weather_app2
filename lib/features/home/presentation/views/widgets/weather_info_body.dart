import 'package:flutter/material.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/presentation/views/widgets/build_aqi_and_uv_index_widget.dart';
import 'package:weather_app/features/home/presentation/views/widgets/build_daily_forecast_widget.dart';
import 'package:weather_app/features/home/presentation/views/widgets/build_hourly_forecast_list_view.dart';
import 'package:weather_app/features/home/presentation/views/widgets/build_items_sliver_grid.dart';
import 'package:weather_app/features/home/presentation/views/widgets/last_updated_widget.dart';
import 'package:weather_app/features/home/presentation/views/widgets/weather_information_section.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});
  final CurrentWeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: LastUpdatedWidget(
            weatherModel: weatherModel,
          ),
        ),
        SliverToBoxAdapter(
          child: WeatherInformationSection(
            weatherModel: weatherModel,
          ),
        ),
        SliverToBoxAdapter(
          child: BuildHourlyForecastListView(
            listHourlyForecast:
                weatherModel.forecastWeather![0].hourlyForecast!,
          ),
        ),
        SliverToBoxAdapter(
          child: BuildDailyForecastWidget(
            weatherModel: weatherModel,
          ),
        ),
        BuildItemsSliverGrid(
          weatherModel: weatherModel,
        ),
        SliverToBoxAdapter(
          child: BuildAqiAndUvIndexWidget(
            weatherModel: weatherModel,
          ),
        )
      ],
    );
  }
}
