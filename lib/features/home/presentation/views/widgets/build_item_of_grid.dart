import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/core/themes/styles.dart';
import 'package:weather_app/features/home/data/models/item_for_grid_view_model.dart';

class BuildItemOfGrid extends StatelessWidget {
  const BuildItemOfGrid({super.key, required this.index, required this.item});
  final int index;
  final ItemForGridViewModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: index == 0 || index == 2 ? 16 : 0,
          right: index == 1 || index == 3 ? 16 : 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.myWhite.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: buildDataOfGridItem(),
    );
  }

  Widget buildDataOfGridItem() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          item.icon,
          width: 40,
          height: 40,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          item.title,
          style: Styles.textStyle16.copyWith(
            color: AppColors.myWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          item.subtitle,
          style: Styles.textStyle14.copyWith(color: AppColors.myGrey),
        ),
      ],
    );
  }
}
