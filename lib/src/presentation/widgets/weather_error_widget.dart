import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../controllers/weather_controller.dart';

class WeatherErrorWidget extends StatelessWidget {
  final WeatherController weatherController;
  final String errorMessage;

  const WeatherErrorWidget({
    super.key,
    required this.weatherController,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.warning, size: 64, color: AppColors.primary),
            const SizedBox(height: 16),
            Text(
              'Oops!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: TextStyle(fontSize: 16, color: AppColors.errorText),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => weatherController.fetchWeatherData(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Try again'),
            ),
          ],
        ),
      ),
    );
  }
}
