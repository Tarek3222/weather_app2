import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/constants/strings.dart';
import 'package:weather_app/core/themes/app_colors.dart';
import 'package:weather_app/core/utils/services_locator.dart';
import 'package:weather_app/features/home/presentation/views/widgets/custom_text_field.dart';

import '../../view_model/get_current_weather_cubit/get_current_weather_cubit.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  TextEditingController searchController = TextEditingController();
  SharedPreferences preferences = getIt<SharedPreferences>();
  List<String> filteredCities = [];
  @override
  Widget build(BuildContext context) {
    List<String> historyCities =
        getIt<SharedPreferences>().getStringList('cities') ?? [];
    return SafeArea(
      child: Column(
        children: [
          CustomTextField(
            searchController: searchController,
            onSubmitted: (value) {
              historyCities.insert(0, value);
              preferences.setStringList('cities', historyCities);
              BlocProvider.of<GetCurrentWeatherCubit>(context)
                  .getCurrentWeather(city: value);
              Navigator.pop(context);
            },
            suffixIconOnPressed: () {
              searchController.clear();
              filteredCities = [];
              setState(() {});
            },
            onChanged: (value) {
              if (value.isNotEmpty) {
                filteredCities = cities
                    .where((element) =>
                        element.toLowerCase().startsWith(value.toLowerCase()))
                    .toList();
                setState(() {});
              } else {
                setState(() {
                  filteredCities = [];
                });
              }
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCities.isEmpty
                  ? historyCities.length
                  : filteredCities.length,
              itemBuilder: (_, index) => filteredCities.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: InkWell(
                        onTap: () {
                          searchController.text = historyCities[index];
                          BlocProvider.of<GetCurrentWeatherCubit>(context)
                              .getCurrentWeather(city: historyCities[index]);
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            Text(
                              historyCities[index],
                              style: const TextStyle(color: AppColors.myWhite),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                historyCities.removeAt(index);
                                preferences.setStringList(
                                    'cities', historyCities);
                                setState(() {});
                              },
                              child: const Icon(
                                Icons.clear_rounded,
                                color: AppColors.myWhite,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        searchController.text = filteredCities[index];
                        historyCities.insert(0, searchController.text);
                        preferences.setStringList('cities', historyCities);
                        BlocProvider.of<GetCurrentWeatherCubit>(context)
                            .getCurrentWeather(city: searchController.text);
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              filteredCities[index],
                              style: const TextStyle(color: AppColors.myWhite),
                            ),
                            InkWell(
                              onTap: () {
                                searchController.text = filteredCities[index];
                                filteredCities = cities
                                    .where((element) => element
                                        .toLowerCase()
                                        .startsWith(searchController.text
                                            .toLowerCase()))
                                    .toList();
                                setState(() {});
                              },
                              child: const Icon(
                                Icons.arrow_outward_rounded,
                                color: AppColors.myWhite,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
