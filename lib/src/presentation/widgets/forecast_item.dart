import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';

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
          color: AppColors.forecastItemBackground,
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
                color: AppColors.secondaryText,
                height: 1.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 17),
              child: Image.network(
                'https:$iconUrl',
                width: 34,
                height: 34,
                errorBuilder:
                    (context, error, stackTrace) => const SizedBox.shrink(),
              ),
            ),
            Text(
              '${temperature.round()}°',
              style: GoogleFonts.archivo(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.secondaryText,
                height: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
