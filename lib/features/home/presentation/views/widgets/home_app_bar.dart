// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/constants/app_routes.dart';
import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/core/themes/styles.dart';
import 'package:weather_app/features/home/presentation/view_model/get_current_weather_cubit/get_current_weather_cubit.dart';

class AnimatedAppBar extends StatefulWidget implements PreferredSizeWidget {
  const AnimatedAppBar({super.key, required this.showAppBar});
  final bool showAppBar;

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  late String lat;
  late String long;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: widget.showAppBar ? 80.h : 0,
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: AppColors.myGrey,
          width: 0.5.w,
        ),
      )),
      duration: const Duration(milliseconds: 400),
      child: AppBar(
        iconTheme: const IconThemeData(color: AppColors.myWhite),
        title: Text(
          'Weather',
          style: Styles.textStyle24.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.search);
            },
            tooltip: 'Search',
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     GoRouter.of(context).push(AppRoutes.notifications);
          //   },
          //   tooltip: 'Your Notifications',
          //   icon: const Icon(
          //     Icons.notifications,
          //     color: Colors.white,
          //   ),
          // ),
          IconButton(
            onPressed: () async {
              try {
                Position position = await getCurrentLocation();
                lat = position.latitude.toString();
                long = position.longitude.toString();
                log('$lat $long');
                BlocProvider.of<GetCurrentWeatherCubit>(context)
                    .getCurrentWeather(city: '$lat,$long');
              } catch (e) {
                log(e.toString());
              }
            },
            tooltip: 'find weather by your location',
            icon: const Icon(
              Icons.location_searching_outlined,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      //request permission
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
