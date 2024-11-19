import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/features/on_boarding/data/models/on_boarding_model.dart';

class BuildDotsIndecator extends StatelessWidget {
  const BuildDotsIndecator(
      {super.key, required this.onBoardingList, required this.currentPage});
  final List<OnBoardingModel> onBoardingList;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onBoardingList.length,
        (index) => buildDot(selectedPage: currentPage == index),
      ),
    );
  }

  buildDot({required bool selectedPage}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 7.h,
      width: selectedPage ? 15.w : 7.w,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:
            selectedPage ? AppColors.onBoardingPrimaryColor : AppColors.myWhite,
      ),
    );
  }
}
