import 'condition_model.dart';

class CurrentWeatherModel {
  final double tempC;
  final ConditionModel condition;
  final double pressureMb;
  final double pressureIn;
  final int humidity;

  CurrentWeatherModel({
    required this.tempC,
    required this.condition,
    required this.pressureMb,
    required this.pressureIn,
    required this.humidity,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      tempC: json['temp_c'],
      condition: ConditionModel.fromJson(json['condition']),
      pressureMb: json['pressure_mb'],
      pressureIn: json['pressure_in'],
      humidity: json['humidity'],
    );
  }
}
