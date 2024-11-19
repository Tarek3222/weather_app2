import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/app_colors.dart';

class BuildAnimatedBall extends StatelessWidget {
  const BuildAnimatedBall(
      {super.key,
      required this.ballY,
      required this.widthVal,
      required this.heightVal,
      required this.times});
  final double ballY;
  final double widthVal;
  final double heightVal;
  final int times;
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, ballY),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: times == 3 ? 5 : 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          width: widthVal,
          height: heightVal,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                AppColors.splashBackgroundPrimaryColor,
                AppColors.splashBackgroundSecondaryColor,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
