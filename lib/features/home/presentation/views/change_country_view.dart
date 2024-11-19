import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/constants/app_assets.dart';
import 'package:weather_app/core/constants/strings.dart';
import 'package:weather_app/core/functions/show_snack_bar.dart';
import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/core/utils/services_locator.dart';

class ChangeCountryView extends StatelessWidget {
  const ChangeCountryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myWhite,
      appBar: AppBar(
        backgroundColor: AppColors.sceondaryColor,
        leading: const BackButton(
          color: AppColors.myWhite,
        ),
        title: const Text(
          'Change Country',
          style: TextStyle(color: AppColors.myWhite),
        ),
      ),
      body: const ChangeCountryBody(),
    );
  }
}

class ChangeCountryBody extends StatefulWidget {
  const ChangeCountryBody({super.key});

  @override
  State<ChangeCountryBody> createState() => _ChangeCountryBodyState();
}

class _ChangeCountryBodyState extends State<ChangeCountryBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
              ),
            ],
            border: Border.all(
              color: AppColors.myGrey,
              width: 0.5,
            ),
          ),
          child: Text(
            'Your country: ${getIt<SharedPreferences>().getString(kCurrentLocation)}',
            style: const TextStyle(color: AppColors.myWhite),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Lottie.asset(
          Assets.imagesCountry,
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          onPressed: () {
            showCountryPicker(
              context: context,
              onSelect: (Country country) {
                getIt<SharedPreferences>()
                    .setString(kCurrentLocation, country.name);
                setState(() {});
                showSnackBar(context: context, text: 'country changed');
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.sceondaryColor,
            padding: const EdgeInsets.all(16),
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down_sharp,
            color: AppColors.myWhite,
          ),
          label: const Text(
            'select country',
            style: TextStyle(
              color: AppColors.myWhite,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
