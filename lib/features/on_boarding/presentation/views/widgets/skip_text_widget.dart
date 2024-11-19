import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/constants/app_routes.dart';
import 'package:weather_app/core/themes/styles.dart';

class SkipTextWidget extends StatelessWidget {
  const SkipTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        GoRouter.of(context).pushReplacement(AppRoutes.selectYourCountry);
      },
      child: Text(
        'Skip',
        style: Styles.textStyle14,
      ),
    );
  }
}
