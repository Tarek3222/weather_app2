import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/core/themes/styles.dart';
import 'package:weather_app/features/splash/presentation/views/widgets/logo_widget.dart';

class BuildWidgetAfterAnimation extends StatelessWidget {
  const BuildWidgetAfterAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            AppColors.splashBackgroundPrimaryColor,
            AppColors.splashBackgroundSecondaryColor,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LogoWidget(),
          Text(
            'Weather',
            style: Styles.textStyleSemiBold40,
          ),
          Text(
            'Forecast',
            style: Styles.textStyle24,
          )
        ],
      ),
    );
  }
}
