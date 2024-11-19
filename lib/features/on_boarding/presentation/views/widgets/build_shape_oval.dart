import 'package:flutter/widgets.dart';
import 'package:weather_app/core/constants/app_assets.dart';

class BuildShapeOval extends StatelessWidget {
  const BuildShapeOval({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.asset(
          Assets.imagesOval,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
