import 'package:flutter/material.dart';
import '../../domain/entities/weather_entity.dart';
import 'forecast_item.dart';

class HourlyForecastList extends StatelessWidget {
  final WeatherEntity weatherEntity;

  const HourlyForecastList({super.key, required this.weatherEntity});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final currentHour = now.hour;
    final todayHours =
        weatherEntity.forecast.first.hour.where((hour) {
          final hourTime = DateTime.parse(hour.time);
          return hourTime.hour >= currentHour;
        }).toList();

    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ForecastItem(
            time: 'Now',
            iconUrl: weatherEntity.current.condition.icon,
            temperature: weatherEntity.current.tempC,
          ),
          ...todayHours.map(
            (hour) => ForecastItem(
              time: hour.formattedTime,
              iconUrl: hour.condition.icon,
              temperature: hour.tempC,
            ),
          ),
        ],
      ),
    );
  }
}
