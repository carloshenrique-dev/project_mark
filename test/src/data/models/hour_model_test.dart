import 'package:flutter_test/flutter_test.dart';
import 'package:project_mark/src/data/models/condition_model.dart';
import 'package:project_mark/src/data/models/hour_model.dart';

void main() {
  group('HourModel', () {
    test('GIVEN a valid JSON '
        'WHEN creating HourModel '
        'THEN return HourModel with correct values', () {
      final json = {
        'time': '2024-01-01 13:00',
        'temp_c': 23.5,
        'pressure_mb': 1013.0,
        'pressure_in': 29.92,
        'condition': {
          'text': 'Sunny',
          'icon': '//cdn.weatherapi.com/weather/64x64/day/113.png',
          'code': 1000,
        },
      };

      final hourModel = HourModel.fromJson(json);

      expect(hourModel.time, equals('2024-01-01 13:00'));
      expect(hourModel.tempC, equals(23.5));
      expect(hourModel.pressureMb, equals(1013.0));
      expect(hourModel.pressureIn, equals(29.92));
      expect(hourModel.condition, isA<ConditionModel>());
      expect(hourModel.condition.text, equals('Sunny'));
    });

    test('GIVEN a JSON with missing fields '
        'WHEN creating HourModel '
        'THEN throw Error', () {
      final json = {
        'time': '2024-01-01 13:00',
        'temp_c': 23.5,
        'pressure_mb': 1013.0,
        'condition': {
          'text': 'Sunny',
          'icon': '//cdn.weatherapi.com/weather/64x64/day/113.png',
          'code': 1000,
        },
      };

      expect(() => HourModel.fromJson(json), throwsA(isA<Error>()));
    });

    test('GIVEN a JSON with null values '
        'WHEN creating HourModel '
        'THEN throw Error', () {
      final json = {
        'time': null,
        'temp_c': null,
        'pressure_mb': null,
        'pressure_in': null,
        'condition': null,
      };

      expect(() => HourModel.fromJson(json), throwsA(isA<Error>()));
    });
  });
}
