import 'package:flutter/material.dart';

class BuildShadowOfBall extends StatelessWidget {
  const BuildShadowOfBall({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 10,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.2),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
