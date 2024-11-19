import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/core/themes/styles.dart';
import 'package:weather_app/features/home/presentation/views/change_country_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryColor,
      width: 250.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChangeCountryView(),
                ),
              );
            },
            leading: const Icon(
              Icons.location_on_outlined,
              color: AppColors.myWhite,
            ),
            title: Text(
              'Change Country',
              style: Styles.textStyle16.copyWith(
                color: AppColors.myWhite,
              ),
            ),
          )
        ],
      ),
    );
  }
}
