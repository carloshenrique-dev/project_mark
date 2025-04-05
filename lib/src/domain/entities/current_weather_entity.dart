import 'condition_entity.dart';

class CurrentWeatherEntity {
  final double tempC;
  final ConditionEntity condition;
  final double pressureMb;
  final double pressureIn;
  final int humidity;

  CurrentWeatherEntity({
    required this.tempC,
    required this.condition,
    required this.pressureMb,
    required this.pressureIn,
    required this.humidity,
  });
}
