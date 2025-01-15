import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:weather_app/features/on_boarding/presentation/views/widgets/description_page_view.dart';
import 'package:weather_app/features/on_boarding/presentation/views/widgets/image_page_view.dart';
import 'package:weather_app/features/on_boarding/presentation/views/widgets/title_page_view.dart';

class PageViewContent extends StatelessWidget {
  const PageViewContent(
      {super.key, required this.onBoardingItem, required this.isOut});
  final OnBoardingModel onBoardingItem;
  final bool isOut;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImagePageView(
          image: onBoardingItem.image,
          isOut: isOut,
        ),
        SizedBox(
          height: 65.h,
        ),
        TitlePageView(
          title: onBoardingItem.title,
          isOut: isOut,
        ),
        SizedBox(
          height: 15.h,
        ),
        DescriptionPageView(
          isOut: isOut,
          description: onBoardingItem.description,
        ),
      ],
    );
  }
}
