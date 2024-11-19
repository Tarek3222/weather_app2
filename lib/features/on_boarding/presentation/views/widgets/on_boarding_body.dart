import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:weather_app/features/on_boarding/presentation/views/widgets/build_arrow_back_button.dart';
import 'package:weather_app/features/on_boarding/presentation/views/widgets/build_dots_indecator.dart';
import 'package:weather_app/features/on_boarding/presentation/views/widgets/build_shape_oval.dart';
import 'package:weather_app/features/on_boarding/presentation/views/widgets/custom_circular_percent_indicator.dart';
import 'package:weather_app/features/on_boarding/presentation/views/widgets/page_view_content.dart';
import 'package:weather_app/features/on_boarding/presentation/views/widgets/skip_text_widget.dart';

import '../../../../../core/constants/app_routes.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  final List<OnBoardingModel> onBoardingList = OnBoardingModel.onBoardingList;
  bool isOut = false;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BuildShapeOval(),
        Positioned(
          top: 20.h,
          left: 0,
          right: 0,
          child: PageViewContent(
            isOut: isOut,
            onBoardingItem: onBoardingList[currentPage],
          ),
        ),
        Positioned(
          top: 30.h,
          right: 10.w,
          child: const SkipTextWidget(),
        ),
        Positioned(
          top: 290.h,
          left: 0,
          right: 0,
          child: BuildDotsIndecator(
            onBoardingList: onBoardingList,
            currentPage: currentPage,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 28.h,
          child: CustomCircularPercentIndicator(
            onTap: () {
              if (currentPage < onBoardingList.length - 1) {
                setState(() {
                  isOut = !isOut;
                });
                Timer(const Duration(milliseconds: 350), () {
                  currentPage++;
                  setState(() {
                    isOut = !isOut;
                  });
                });
              } else {
                GoRouter.of(context)
                    .pushReplacement(AppRoutes.selectYourCountry);
              }
            },
            currentPage: currentPage,
          ),
        ),
        Positioned(
          top: 33.h,
          left: 10.w,
          child: currentPage == 0
              ? const SizedBox()
              : BuildArrowBackButton(
                  onPressed: () {
                    setState(() {
                      isOut = !isOut;
                    });
                    Timer(
                      const Duration(milliseconds: 350),
                      () {
                        currentPage--;
                        setState(() {
                          isOut = !isOut;
                        });
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}
