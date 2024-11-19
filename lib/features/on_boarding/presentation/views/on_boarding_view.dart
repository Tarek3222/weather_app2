import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/features/on_boarding/presentation/views/widgets/on_boarding_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.sceondaryColor,
              AppColors.primaryColor,
            ],
          ),
        ),
        child: const OnBoardingBody(),
      ),
    );
  }
}
