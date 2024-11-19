import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/core/themes/styles.dart';
import 'package:weather_app/features/home/presentation/views/widgets/build_custom_divider.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.myGrey.withOpacity(0.3),
      highlightColor: AppColors.myWhite.withOpacity(0.5),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 108),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xff32333E),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              '',
              style: Styles.textStyle12.copyWith(
                color: AppColors.myGrey,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              '.....wfwfwfwf',
              style: Styles.textStyleSemiBold40,
            ),
          ),
          const BuildCustomDivider(),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: SizedBox(
              height: 125.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 24,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xff000000).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      '         ',
                      style: Styles.textStyle12,
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 65),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              '.....wfwfwfwf',
              style: Styles.textStyleSemiBold40,
            ),
          ),
        ],
      ),
    );
  }
}
