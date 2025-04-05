import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/di/weather_dependencies.dart';
import 'src/presentation/pages/weather_page.dart';

void main() {
  initializeDependencies();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  ThemeData _buildTheme(Brightness brightness) {
    var baseTheme = ThemeData(
      brightness: brightness,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.white,
        brightness: brightness,
      ),
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.archivoTextTheme(baseTheme.textTheme),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: _buildTheme(Brightness.light),
      home: const WeatherPage(),
    );
  }
}
