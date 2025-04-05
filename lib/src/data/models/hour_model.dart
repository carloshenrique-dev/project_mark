import 'condition_model.dart';

class HourModel {
  final String time;
  final double tempC;
  final double pressureMb;
  final double pressureIn;
  final ConditionModel condition;

  HourModel({
    required this.time,
    required this.tempC,
    required this.pressureMb,
    required this.pressureIn,
    required this.condition,
  });

  factory HourModel.fromJson(Map<String, dynamic> json) {
    return HourModel(
      time: json['time'],
      tempC: json['temp_c'],
      pressureMb: json['pressure_mb'],
      pressureIn: json['pressure_in'],
      condition: ConditionModel.fromJson(json['condition']),
    );
  }
}
