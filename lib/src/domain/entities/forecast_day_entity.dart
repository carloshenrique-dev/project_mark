import 'package:flutter/material.dart';
import 'day_entity.dart';
import 'hour_entity.dart';

class ForecastDayEntity {
  final String date;
  final DayEntity day;
  final List<HourEntity> hour;

  ForecastDayEntity({
    required this.date,
    required this.day,
    required this.hour,
  });

  Color getTemperatureColor({required bool isMinTemp}) {
    final temp = isMinTemp ? day.mintempC : day.maxtempC;
    if (temp <= 5) {
      return Colors.blue.shade300;
    } else if (temp > 5 && temp <= 25) {
      return Colors.orange.shade300;
    } else {
      return Colors.red.shade300;
    }
  }
}
