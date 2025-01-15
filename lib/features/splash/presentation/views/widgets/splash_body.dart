// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/constants/app_routes.dart';
import 'package:weather_app/core/constants/size_config.dart';
import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/core/utils/services_locator.dart';
import 'package:weather_app/features/splash/presentation/views/widgets/build_animated_ball.dart';
import 'package:weather_app/features/splash/presentation/views/widgets/build_shadow_of_ball.dart';
import 'package:weather_app/features/splash/presentation/views/widgets/build_widget_after_animate.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _MyAppState();
}

class _MyAppState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  double ballY = 0;
  double widthVal = 50;
  double heightVal = 50;
  double bottomVal = 500;
  bool add = false;
  bool showShadow = false;
  int times = 0;
  bool showSplashBody = false;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    initAnimation();
    startTimer();
  }

  void initAnimation() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..addListener(
            () {
              if (add) {
                ballY += 15;
              } else {
                ballY -= 15;
              }
              if (ballY <= -200) {
                times += 1;
                add = true;
                showShadow = true;
              }
              if (ballY >= 0) {
                add = false;
                showShadow = false;
                widthVal += 50;
                heightVal += 50;
                bottomVal -= 200;
              }
              if (times == 3) {
                showShadow = false;
                widthVal = SizeConfig.screenWidth(context);
                heightVal = SizeConfig.screenHeight(context);
                Timer(Duration(milliseconds: 300), () {
                  setState(() {
                    showSplashBody = true;
                  });
                });
                _controller.stop();
              }
              setState(() {});
            },
          );
    _controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void startTimer() {
    Future.delayed(const Duration(seconds: 3), () {
      navigateToInitScreen();
    });
  }

  void navigateToInitScreen() {
    SharedPreferences prefs = getIt<SharedPreferences>();
    bool isFirstTime = prefs.getBool(
          'isFirstTime',
        ) ??
        true;
    if (isFirstTime) {
      GoRouter.of(context).pushReplacement(AppRoutes.onBoarding);
    } else {
      GoRouter.of(context).pushReplacement(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myGrey,
      body: SizedBox(
        width: SizeConfig.screenWidth(context),
        height: SizeConfig.screenHeight(context),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              bottom: bottomVal,
              duration: Duration(milliseconds: 600),
              child: Column(
                children: [
                  BuildAnimatedBall(
                    ballY: ballY,
                    widthVal: widthVal,
                    heightVal: heightVal,
                    times: times,
                  ),
                  if (showShadow) BuildShadowOfBall(),
                ],
              ),
            ),
            if (showSplashBody)
              Positioned(
                child: BuildWidgetAfterAnimation(),
              ),
          ],
        ),
      ),
    );
  }
}
