import 'package:flutter/material.dart';

abstract class SizeConfig {
  static double screenHeight(context) => MediaQuery.of(context).size.height;
  static double screenWidth(context) => MediaQuery.of(context).size.width;
}
