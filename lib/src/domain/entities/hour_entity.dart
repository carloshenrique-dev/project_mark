import 'condition_entity.dart';

class HourEntity {
  final String time;
  final double tempC;
  final double pressureMb;
  final double pressureIn;
  final ConditionEntity condition;

  HourEntity({
    required this.time,
    required this.tempC,
    required this.pressureMb,
    required this.pressureIn,
    required this.condition,
  });

  String get formattedTime {
    final dateTime = DateTime.parse(time);
    final hour = dateTime.hour;
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
    return '$displayHour$period';
  }
}
