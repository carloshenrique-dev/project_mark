import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForecastItem extends StatelessWidget {
  final String time;
  final String iconUrl;
  final double temperature;

  const ForecastItem({
    super.key,
    required this.time,
    required this.iconUrl,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 87,
        decoration: BoxDecoration(
          color: const Color(0xFFEDF2F7),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: GoogleFonts.archivo(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFA0AEC0),
                height: 1.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 17),
              child: Image.network('https:$iconUrl', width: 34, height: 34),
            ),
            Text(
              '${temperature.round()}°',
              style: GoogleFonts.archivo(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFA0AEC0),
                height: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
