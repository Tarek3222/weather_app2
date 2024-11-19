import 'package:flutter/material.dart';

class ImagePageView extends StatelessWidget {
  const ImagePageView({super.key, required this.image, required this.isOut});
  final String image;
  final bool isOut;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: AnimatedScale(
          scale: isOut ? 0 : 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          child: Image.asset(
            image,
          ),
        ),
      ),
    );
  }
}
