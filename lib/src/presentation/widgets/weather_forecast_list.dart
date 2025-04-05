import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';
import '../../domain/entities/weather_entity.dart';

class WeatherForecastList extends StatelessWidget {
  final WeatherEntity weatherEntity;

  const WeatherForecastList({super.key, required this.weatherEntity});

  String _getWeekday(String date) {
    final DateTime dateTime = DateTime.parse(date);
    final weekdays = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];
    return weekdays[dateTime.weekday % 7];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Next 7 Days',
            style: GoogleFonts.archivo(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: weatherEntity.forecast.length - 1,
            itemBuilder: (context, index) {
              final forecast = weatherEntity.forecast[index + 1];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        _getWeekday(forecast.date),
                        style: GoogleFonts.archivo(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: AppColors.tertiaryText,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Image.network(
                          'https:${forecast.day.condition.icon}',
                          width: 34,
                          height: 34,
                          errorBuilder:
                              (context, error, stackTrace) =>
                                  const SizedBox.shrink(),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${forecast.day.mintempC.round()}°  / ',
                            style: GoogleFonts.archivo(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: forecast.getTemperatureColor(
                                isMinTemp: true,
                              ),
                            ),
                          ),
                          Text(
                            '${forecast.day.maxtempC.round()}°',
                            style: GoogleFonts.archivo(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: forecast.getTemperatureColor(
                                isMinTemp: false,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
