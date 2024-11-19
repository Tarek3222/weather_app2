import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/features/home/presentation/views/widgets/search_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SearchBody(),
    );
  }
}
