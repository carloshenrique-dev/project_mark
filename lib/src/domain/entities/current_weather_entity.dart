import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import 'condition_entity.dart';

class CurrentWeatherEntity {
  final double tempC;
  final ConditionEntity condition;
  final double pressureMb;
  final double pressureIn;
  final int humidity;

  CurrentWeatherEntity({
    required this.tempC,
    required this.condition,
    required this.pressureMb,
    required this.pressureIn,
    required this.humidity,
  });

  List<Color> get temperatureGradient {
    if (tempC <= 5) {
      return AppColors.lowGradient;
    } else if (tempC >= 5 && tempC <= 25) {
      return AppColors.mediumGradient;
    } else {
      return AppColors.highGradient;
    }
  }
}
