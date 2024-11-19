import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:weather_app/features/on_boarding/presentation/views/widgets/build_container_to_continue.dart';

class CustomCircularPercentIndicator extends StatelessWidget {
  const CustomCircularPercentIndicator(
      {super.key, required this.onTap, required this.currentPage});
  final VoidCallback onTap;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 47.r,
      animation: true,
      animationDuration: 500,
      backgroundWidth: 0.4.w,
      lineWidth: 5.w,
      percent: currentPage == 0
          ? 0.25
          : currentPage == 1
              ? 0.5
              : currentPage == 2
                  ? 0.75
                  : 1,
      animateFromLastPercent: true,
      linearGradient: const LinearGradient(
        colors: [
          Color(0xffC23ACC),
          Color(0xffFF4F80),
        ],
      ),
      backgroundColor: const Color(0xffBBC5D4),
      circularStrokeCap: CircularStrokeCap.round,
      center: BuildContainerToContinue(
        onTap: onTap,
        child: currentPage == 3
            ? const Icon(
                Icons.check,
                color: Colors.white,
              )
            : const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
      ),
    );
  }
}
