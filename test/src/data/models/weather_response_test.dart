import 'package:flutter_test/flutter_test.dart';
import 'package:project_mark/src/data/models/weather_response.dart';

void main() {
  group('WeatherResponse', () {
    test('GIVEN a valid JSON '
        'WHEN creating WeatherResponse '
        'THEN return WeatherResponse with correct values', () {
      final json = {
        'location': {'name': 'São Paulo', 'region': 'SP'},
        'current': {
          'temp_c': 25.0,
          'condition': {
            'text': 'Partly cloudy',
            'icon': '//cdn.weatherapi.com/weather/64x64/day/116.png',
            'code': 1003,
          },
          'pressure_mb': 1012.0,
          'pressure_in': 29.88,
          'humidity': 65,
        },
        'forecast': {
          'forecastday': [
            {
              'date': '2024-04-05',
              'date_epoch': 1712275200,
              'day': {
                'maxtemp_c': 28.0,
                'mintemp_c': 20.0,
                'condition': {
                  'text': 'Sunny',
                  'icon': '//cdn.weatherapi.com/weather/64x64/day/113.png',
                  'code': 1000,
                },
              },
              'hour': [
                {
                  'time': '2024-04-05 00:00',
                  'temp_c': 22.0,
                  'pressure_mb': 1012.0,
                  'pressure_in': 29.88,
                  'condition': {
                    'text': 'Clear',
                    'icon': '//cdn.weatherapi.com/weather/64x64/night/113.png',
                    'code': 1000,
                  },
                },
              ],
            },
          ],
        },
      };

      final response = WeatherResponse.fromJson(json);

      expect(response.location.name, equals('São Paulo'));
      expect(response.location.region, equals('SP'));
      expect(response.current.tempC, equals(25.0));
      expect(response.current.condition.text, equals('Partly cloudy'));
      expect(response.current.pressureMb, equals(1012.0));
      expect(response.current.humidity, equals(65));
      expect(response.forecast.length, equals(1));
      expect(response.forecast[0].date, equals('2024-04-05'));
      expect(response.forecast[0].day.maxtempC, equals(28.0));
      expect(response.forecast[0].day.mintempC, equals(20.0));
      expect(response.forecast[0].hour.length, equals(1));
      expect(response.forecast[0].hour[0].tempC, equals(22.0));
    });

    test('GIVEN a valid WeatherResponse '
        'WHEN converting to WeatherEntity '
        'THEN return WeatherEntity with correct values', () {
      final json = {
        'location': {'name': 'São Paulo', 'region': 'SP'},
        'current': {
          'temp_c': 25.0,
          'condition': {
            'text': 'Partly cloudy',
            'icon': '//cdn.weatherapi.com/weather/64x64/day/116.png',
            'code': 1003,
          },
          'pressure_mb': 1012.0,
          'pressure_in': 29.88,
          'humidity': 65,
        },
        'forecast': {
          'forecastday': [
            {
              'date': '2024-04-05',
              'date_epoch': 1712275200,
              'day': {
                'maxtemp_c': 28.0,
                'mintemp_c': 20.0,
                'condition': {
                  'text': 'Sunny',
                  'icon': '//cdn.weatherapi.com/weather/64x64/day/113.png',
                  'code': 1000,
                },
              },
              'hour': [
                {
                  'time': '2024-04-05 00:00',
                  'temp_c': 22.0,
                  'pressure_mb': 1012.0,
                  'pressure_in': 29.88,
                  'condition': {
                    'text': 'Clear',
                    'icon': '//cdn.weatherapi.com/weather/64x64/night/113.png',
                    'code': 1000,
                  },
                },
              ],
            },
          ],
        },
      };

      final response = WeatherResponse.fromJson(json);
      final entity = WeatherResponse.toEntity(response);

      expect(entity.location.name, equals('São Paulo'));
      expect(entity.location.region, equals('SP'));
      expect(entity.current.tempC, equals(25.0));
      expect(entity.current.condition.text, equals('Partly cloudy'));
      expect(entity.current.pressureMb, equals(1012.0));
      expect(entity.current.humidity, equals(65));
      expect(entity.forecast.length, equals(1));
      expect(entity.forecast[0].date, equals('2024-04-05'));
      expect(entity.forecast[0].day.maxtempC, equals(28.0));
      expect(entity.forecast[0].day.mintempC, equals(20.0));
      expect(entity.forecast[0].hour.length, equals(1));
      expect(entity.forecast[0].hour[0].tempC, equals(22.0));
    });
  });
}
