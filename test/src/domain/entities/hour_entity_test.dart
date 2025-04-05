import 'package:flutter_test/flutter_test.dart';
import 'package:project_mark/src/domain/entities/condition_entity.dart';
import 'package:project_mark/src/domain/entities/hour_entity.dart';

void main() {
  group('HourEntity', () {
    test('GIVEN a time in 24-hour format '
        'WHEN formattedTime is called '
        'THEN it returns the correct 12-hour format with AM/PM', () {
      final hourEntity = HourEntity(
        time: '2023-03-15T14:30:00',
        tempC: 25.0,
        pressureMb: 1013.0,
        pressureIn: 29.91,
        condition: ConditionEntity(text: 'Sunny', icon: 'sunny.png', code: 1),
      );

      expect(hourEntity.formattedTime, '2PM');
    });

    test('GIVEN a time at midnight '
        'WHEN formattedTime is called '
        'THEN it returns 12AM', () {
      final hourEntity = HourEntity(
        time: '2023-03-15T00:00:00',
        tempC: 20.0,
        pressureMb: 1010.0,
        pressureIn: 29.83,
        condition: ConditionEntity(text: 'Clear', icon: 'clear.png', code: 2),
      );

      expect(hourEntity.formattedTime, '12AM');
    });

    test('GIVEN a time at noon '
        'WHEN formattedTime is called '
        'THEN it returns 12PM', () {
      final hourEntity = HourEntity(
        time: '2023-03-15T12:00:00',
        tempC: 30.0,
        pressureMb: 1015.0,
        pressureIn: 30.00,
        condition: ConditionEntity(text: 'Cloudy', icon: 'cloudy.png', code: 3),
      );

      expect(hourEntity.formattedTime, '12PM');
    });
  });
}
