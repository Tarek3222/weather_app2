import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/styles.dart';

class TitlePageView extends StatelessWidget {
  const TitlePageView({super.key, required this.title, required this.isOut});
  final String title;
  final bool isOut;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 300),
      scale: isOut ? 0 : 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          title,
          style: Styles.textStyle28,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
