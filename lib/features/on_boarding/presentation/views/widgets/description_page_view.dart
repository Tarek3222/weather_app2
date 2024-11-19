import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/styles.dart';

class DescriptionPageView extends StatelessWidget {
  const DescriptionPageView(
      {super.key, required this.description, required this.isOut});
  final String description;
  final bool isOut;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 300),
      scale: isOut ? 0 : 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          description,
          style: Styles.textStyle16,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
