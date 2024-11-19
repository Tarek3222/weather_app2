import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/constants/app_assets.dart';
import 'package:weather_app/core/constants/app_routes.dart';
import 'package:weather_app/core/constants/strings.dart';
import 'package:weather_app/core/functions/show_snack_bar.dart';
import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/core/utils/services_locator.dart';

class SelectYourCountryView extends StatelessWidget {
  const SelectYourCountryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.sceondaryColor,
      body: SelectYourCountryBody(),
    );
  }
}

class SelectYourCountryBody extends StatefulWidget {
  const SelectYourCountryBody({super.key});

  @override
  State<SelectYourCountryBody> createState() => _SelectYourCountryBodyState();
}

class _SelectYourCountryBodyState extends State<SelectYourCountryBody> {
  String? selectedCountry;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        if (selectedCountry != null)
          AnimatedContainer(
            padding: const EdgeInsets.all(16),
            duration: const Duration(seconds: 1),
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
              'Selected country: $selectedCountry',
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
                selectedCountry = country.name;
                setState(() {});
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
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
        OutlinedButton(
          onPressed: () {
            if (selectedCountry != null) {
              getIt<SharedPreferences>()
                  .setString(kCurrentLocation, selectedCountry!);
              getIt<SharedPreferences>().setBool('isFirstTime', false);
              GoRouter.of(context).pushReplacement(AppRoutes.home);
            } else {
              showSnackBar(
                  context: context, text: 'please select your country');
            }
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            padding: const EdgeInsets.all(24),
            overlayColor: Colors.red,
          ),
          child: const Text(
            'Go',
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
