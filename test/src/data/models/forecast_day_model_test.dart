import 'package:flutter_test/flutter_test.dart';
import 'package:project_mark/src/data/models/day_model.dart';
import 'package:project_mark/src/data/models/hour_model.dart';
import 'package:project_mark/src/data/models/forecast_day_model.dart';

void main() {
  group('ForecastDayModel', () {
    test('GIVEN a valid JSON '
        'WHEN creating ForecastDayModel '
        'THEN return ForecastDayModel with correct values', () {
      final json = {
        'date': '2024-01-01',
        'date_epoch': 1704067200,
        'day': {
          'maxtemp_c': 25.5,
          'mintemp_c': 15.2,
          'condition': {
            'text': 'Sunny',
            'icon': '//cdn.weatherapi.com/weather/64x64/day/113.png',
            'code': 1000,
          },
        },
        'hour': [
          {
            'time': '2024-01-01 00:00',
            'temp_c': 18.5,
            'pressure_mb': 1013.0,
            'pressure_in': 29.92,
            'condition': {
              'text': 'Clear',
              'icon': '//cdn.weatherapi.com/weather/64x64/night/113.png',
              'code': 1000,
            },
          },
        ],
      };

      final forecastDayModel = ForecastDayModel.fromJson(json);

      expect(forecastDayModel.date, equals('2024-01-01'));
      expect(forecastDayModel.dateEpoch, equals(1704067200));
      expect(forecastDayModel.day, isA<DayModel>());
      expect(forecastDayModel.hour, isA<List<HourModel>>());
      expect(forecastDayModel.hour.length, equals(1));
    });

    test('GIVEN a JSON with missing fields '
        'WHEN creating ForecastDayModel '
        'THEN throw Error', () {
      final json = {
        'date': '2024-01-01',
        'day': {
          'maxtemp_c': 25.5,
          'mintemp_c': 15.2,
          'condition': {
            'text': 'Sunny',
            'icon': '//cdn.weatherapi.com/weather/64x64/day/113.png',
            'code': 1000,
          },
        },
      };

      expect(() => ForecastDayModel.fromJson(json), throwsA(isA<Error>()));
    });

    test('GIVEN a JSON with null values '
        'WHEN creating ForecastDayModel '
        'THEN throw Error', () {
      final json = {
        'date': null,
        'date_epoch': null,
        'day': null,
        'hour': null,
      };

      expect(() => ForecastDayModel.fromJson(json), throwsA(isA<Error>()));
    });
  });
}
