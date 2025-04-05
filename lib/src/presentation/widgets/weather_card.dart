import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/entities/weather_entity.dart';

class WeatherCard extends StatelessWidget {
  final WeatherEntity weatherEntity;

  const WeatherCard({super.key, required this.weatherEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, top: 35),
      child: Container(
        padding: const EdgeInsets.only(left: 20, top: 20),
        width: 335,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.topLeft,
            colors: [Color(0xFF8ACDE2), Color(0xFF53B6D7)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${weatherEntity.location.name} / ${weatherEntity.location.splitRegion}',
              style: GoogleFonts.archivo(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                height: 0.75,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, bottom: 20),
              child: Text(
                '${weatherEntity.current.tempC.round()}°C',
                style: GoogleFonts.archivo(
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  height: 0.75,
                ),
              ),
            ),
            Text(
              'Humidity: ${weatherEntity.current.humidity}%',
              style: GoogleFonts.archivo(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                height: 1.0,
              ),
            ),
            Text(
              'Pressure: ${weatherEntity.current.pressureMb} hPa',
              style: GoogleFonts.archivo(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                height: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
