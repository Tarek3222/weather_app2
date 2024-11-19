import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_assets.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 200 / 147,
      child: Image.asset(
        Assets.imagesSplashIcon,
      ),
    );
  }
}
