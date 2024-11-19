import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_assets.dart';
import 'package:weather_app/features/home/data/models/current_weather_model.dart';
import 'package:weather_app/features/home/data/models/item_for_grid_view_model.dart';
import 'package:weather_app/features/home/presentation/views/widgets/build_item_of_grid.dart';

class BuildItemsSliverGrid extends StatelessWidget {
  const BuildItemsSliverGrid({super.key, required this.weatherModel});
  final CurrentWeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    final List<ItemForGridViewModel> items = [
      ItemForGridViewModel(
          icon: Assets.imagesSun,
          title: 'Sunrise',
          subtitle: weatherModel.forecastWeather![0].sunrise!),
      ItemForGridViewModel(
          icon: Assets.imagesSunset,
          title: 'Sunset',
          subtitle: weatherModel.forecastWeather![0].sunset!),
      ItemForGridViewModel(
          icon: Assets.imagesWind,
          title: 'wind',
          subtitle: '${weatherModel.windSpeed} km/h'),
      ItemForGridViewModel(
          icon: Assets.imagesHumidity,
          title: 'humidity',
          subtitle: '${weatherModel.humidity}%'),
    ];
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) =>
          BuildItemOfGrid(index: index, item: items[index]),
    );
  }
}
