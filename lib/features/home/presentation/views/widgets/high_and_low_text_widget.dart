import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/styles.dart';

class HighAndLowTextWidget extends StatelessWidget {
  const HighAndLowTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 22),
        child: Text(
          'High   |   Low',
          style: Styles.textStyle12,
        ),
      ),
    );
  }
}
