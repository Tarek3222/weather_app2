import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.searchController,
      this.suffixIconOnPressed,
      this.onChanged,
      this.onSubmitted});
  final TextEditingController searchController;
  final VoidCallback? suffixIconOnPressed;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 5,
      shadowColor: Colors.white.withOpacity(0.1),
      borderRadius: BorderRadius.circular(30),
      child: TextField(
        autofocus: true,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        controller: searchController,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.sceondaryColor,
          border: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          prefixIcon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            splashRadius: 20,
            splashColor: AppColors.myWhite,
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.myWhite,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: suffixIconOnPressed,
            splashRadius: 20,
            splashColor: AppColors.myWhite,
            icon: const Icon(
              Icons.clear,
              color: AppColors.myWhite,
            ),
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(color: AppColors.myWhite),
        ),
      ),
    );
  }
}
