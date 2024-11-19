import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/constants/strings.dart';
import 'package:weather_app/core/utils/services_locator.dart';
import 'package:weather_app/features/home/presentation/view_model/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:weather_app/features/home/presentation/views/widgets/custom_drawer.dart';
import 'package:weather_app/features/home/presentation/views/widgets/home_body.dart';

import '../../../../core/themes/app_colors.dart';
import 'widgets/home_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetCurrentWeatherCubit>(context).getCurrentWeather(
      city: getIt<SharedPreferences>().getString(kCurrentLocation) ?? 'cairo',
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AnimatedAppBar(showAppBar: true),
      body: HomeBody(),
      drawer: CustomDrawer(),
    );
  }
}
