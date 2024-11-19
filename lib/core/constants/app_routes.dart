import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/features/home/presentation/views/home_view.dart';
import 'package:weather_app/features/home/presentation/views/search_view.dart';
import 'package:weather_app/features/notifications/presentation/views/notifications_view.dart';
import 'package:weather_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:weather_app/features/on_boarding/presentation/views/select_your_country_view.dart';
import 'package:weather_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRoutes {
  static const splash = '/';
  static const onBoarding = '/onboarding';
  static const home = '/home';
  static const search = '/search';
  static const String selectYourCountry = '/select_your_country';
  static const String notifications = '/notifications';

  static final routers = GoRouter(
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: onBoarding,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: search,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 200),
            child: const SearchView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.linear).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: selectYourCountry,
        builder: (context, state) => const SelectYourCountryView(),
      ),
      GoRoute(
        path: notifications,
        builder: (context, state) => const NotificationsView(),
      ),
    ],
  );
}
