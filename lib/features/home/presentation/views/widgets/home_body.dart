import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/view_model/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:weather_app/features/home/presentation/views/widgets/custom_background_container.dart';
import 'package:weather_app/features/home/presentation/views/widgets/custom_loading_widget.dart';
import 'package:weather_app/features/home/presentation/views/widgets/error_custom_widget.dart';
import 'package:weather_app/features/home/presentation/views/widgets/no_weather_body.dart';
import 'package:weather_app/features/home/presentation/views/widgets/weather_info_body_with_refresh_indecator.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: BlocBuilder<GetCurrentWeatherCubit, GetCurrentWeatherState>(
        builder: (context, state) {
          if (state is GetCurrentWeatherSuccess) {
            return WeatherInfoBodyWithRefreshIndecator(
              weatherModel: state.currentWeatherModel,
            );
          } else if (state is GetCurrentWeatherError) {
            return ErrorCustomWidget(errorMessage: state.errorMessage);
          } else if (state is GetCurrentWeatherLoading) {
            return const CustomLoadingWidget();
          } else {
            return const NoWeatherBody();
          }
        },
      ),
    );
  }
}
