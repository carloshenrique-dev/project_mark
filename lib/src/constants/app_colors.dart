import 'package:flutter/material.dart';

sealed class AppColors {
  // Primary colors
  static const primary = Color(0xFF2D3748);
  static const primaryLight = Color(0xFF4A5568);

  // Background colors
  static const background = Colors.white;
  static const inactiveDot = Color(0xFFE2E8F0);
  static const errorText = Color(0xFF4A5568);

  // Forecast item colors
  static const forecastItemBackground = Color(0xFFEDF2F7);
  static const secondaryText = Color(0xFFA0AEC0);
  static const tertiaryText = Color(0xFF718096);

  // Gradient colors
  static const lowGradient = [Color(0xFF8ACDE2), Color(0xFF53B6D7)];
  static const mediumGradient = [Color(0xFFFF8D5D), Color(0xFFFF6B3D)];
  static const highGradient = [Color(0xFFFF5252), Color(0xFFFF1744)];
}
