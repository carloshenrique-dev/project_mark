import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';
import '../../domain/entities/weather_entity.dart';
import 'hourly_forecast_list.dart';

class CurrentWeatherInfo extends StatelessWidget {
  final WeatherEntity weatherEntity;

  const CurrentWeatherInfo({super.key, required this.weatherEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, left: 35, bottom: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today',
            style: GoogleFonts.archivo(
              fontSize: 21,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 21),
          HourlyForecastList(weatherEntity: weatherEntity),
        ],
      ),
    );
  }
}
