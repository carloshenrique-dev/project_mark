import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_mark/src/domain/entities/condition_entity.dart';
import 'package:project_mark/src/domain/entities/day_entity.dart';
import 'package:project_mark/src/domain/entities/forecast_day_entity.dart';
import 'package:project_mark/src/domain/entities/hour_entity.dart';

void main() {
  group('ForecastDayEntity', () {
    late ForecastDayEntity forecastDayEntity;

    setUp(() {
      forecastDayEntity = ForecastDayEntity(
        date: '2023-10-01',
        day: DayEntity(
          mintempC: 10,
          maxtempC: 30,
          condition: ConditionEntity(code: 2, icon: 'icon', text: 'text'),
        ),
        hour: [
          HourEntity(
            time: '10:00',
            tempC: 15,
            pressureMb: 25.9,
            pressureIn: 343.3,

            condition: ConditionEntity(code: 2, icon: 'icon', text: 'text'),
          ),
          HourEntity(
            time: '14:00',
            tempC: 20,
            condition: ConditionEntity(code: 2, icon: 'icon', text: 'text'),
            pressureMb: 23.1,
            pressureIn: 143.2,
          ),
        ],
      );
    });

    test('GIVEN a temperature <= 5 and isMinTemp is true '
        'WHEN getTemperatureColor is called '
        'THEN it returns blue color', () {
      forecastDayEntity = ForecastDayEntity(
        date: '2023-10-01',
        day: DayEntity(
          mintempC: 5,
          maxtempC: 30,
          condition: ConditionEntity(code: 1, icon: 'icon', text: 'text'),
        ),
        hour: [],
      );

      final color = forecastDayEntity.getTemperatureColor(isMinTemp: true);

      expect(color, Colors.blue.shade300);
    });

    test('GIVEN a temperature between 5 and 25 and isMinTemp is true '
        'WHEN getTemperatureColor is called '
        'THEN it returns orange color', () {
      forecastDayEntity = ForecastDayEntity(
        date: '2023-10-01',
        day: DayEntity(
          mintempC: 15,
          maxtempC: 30,
          condition: ConditionEntity(code: 1, icon: 'icon', text: 'text'),
        ),
        hour: [],
      );

      final color = forecastDayEntity.getTemperatureColor(isMinTemp: true);

      expect(color, Colors.orange.shade300);
    });

    test('GIVEN a temperature > 25 and isMinTemp is false '
        'WHEN getTemperatureColor is called '
        'THEN it returns red color', () {
      forecastDayEntity = ForecastDayEntity(
        date: '2023-10-01',
        day: DayEntity(
          mintempC: 10,
          maxtempC: 26,
          condition: ConditionEntity(code: 1, icon: 'icon', text: 'text'),
        ),
        hour: [],
      );

      final color = forecastDayEntity.getTemperatureColor(isMinTemp: false);

      expect(color, Colors.red.shade300);
    });

    test('GIVEN a temperature <= 5 and isMinTemp is false '
        'WHEN getTemperatureColor is called '
        'THEN it returns blue color', () {
      forecastDayEntity = ForecastDayEntity(
        date: '2023-10-01',
        day: DayEntity(
          mintempC: 10,
          maxtempC: 5,
          condition: ConditionEntity(code: 1, icon: 'icon', text: 'text'),
        ),
        hour: [],
      );

      final color = forecastDayEntity.getTemperatureColor(isMinTemp: false);

      expect(color, Colors.blue.shade300);
    });

    test('GIVEN a temperature between 5 and 25 and isMinTemp is false '
        'WHEN getTemperatureColor is called '
        'THEN it returns orange color', () {
      forecastDayEntity = ForecastDayEntity(
        date: '2023-10-01',
        day: DayEntity(
          mintempC: 10,
          maxtempC: 20,
          condition: ConditionEntity(code: 1, icon: 'icon', text: 'text'),
        ),
        hour: [],
      );

      final color = forecastDayEntity.getTemperatureColor(isMinTemp: false);

      expect(color, Colors.orange.shade300);
    });
  });
}
