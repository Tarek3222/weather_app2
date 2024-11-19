import 'package:weather_app/core/constants/app_assets.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String description;

  const OnBoardingModel(
      {required this.image, required this.title, required this.description});

  static List<OnBoardingModel> onBoardingList = const [
    OnBoardingModel(
        image: Assets.imagesOnBoarding1,
        title: 'Detailed Hourly Forecast',
        description: 'Get in - depth weather information.'),
    OnBoardingModel(
        image: Assets.imagesOnBoarding2,
        title: 'Real-Time Weather Map',
        description:
            'Watch the progress of the precipitation to stay informed'),
    OnBoardingModel(
        image: Assets.imagesOnBoarding3,
        title: 'Weather Around the World',
        description: 'Add any location you want and swipe easily to chnage.'),
    OnBoardingModel(
        image: Assets.imagesOnBoarding4,
        title: 'Get Weather our Location',
        description: 'Get Your Current Weather Location when you want it'),
  ];
}
