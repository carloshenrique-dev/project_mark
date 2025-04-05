import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:project_mark/src/constants/weather_service_constants.dart';
import 'package:project_mark/src/data/models/weather_response.dart';
import 'package:project_mark/src/data/services/weather_service.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late WeatherService weatherService;
  late MockHttpClient mockClient;

  setUpAll(() {
    registerFallbackValue(Uri.parse(WeatherServiceConstants.baseUrl));
  });

  setUp(() {
    mockClient = MockHttpClient();
    weatherService = WeatherService(client: mockClient);
  });

  group('getWeatherForCity', () {
    test('GIVEN a successful API call '
        'WHEN getting weather for city '
        'THEN return WeatherResponse with correct data ', () async {
      final mockResponse = '''
        {
          "location": {
            "name": "Joinville",
            "region": "Santa Catarina",
            "country": "Brazil"
          },
          "current": {
            "temp_c": 25.94,
            "condition": {
              "text": "Cloudy",
              "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
              "code": 1003
            },
            "pressure_mb": 1012.0,
            "pressure_in": 29.88,
            "humidity": 97
          },
          "forecast": {
            "forecastday": []
          }
        }
      ''';

      when(
        () => mockClient.get(any()),
      ).thenAnswer((_) async => http.Response(mockResponse, 200));

      final result = await weatherService.getWeatherForCity(
        cityName: 'Joinville',
      );

      expect(result, isA<WeatherResponse>());
      expect(result.location.name, equals('Joinville'));
      expect(result.current.tempC, equals(25.94));
      expect(result.current.pressureMb, equals(1012.0));
      expect(result.current.humidity, equals(97));
    });

    test('GIVEN an unsuccessful API call '
        'WHEN getting weather for city '
        'THEN throw exception', () async {
      when(
        () => mockClient.get(any()),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(
        () => weatherService.getWeatherForCity(cityName: 'Joinville'),
        throwsException,
      );
    });
  });

  group('getCurrentWeatherForCity', () {
    test('GIVEN a successful API call '
        'WHEN getting current weather for city '
        'THEN return WeatherResponse with correct data', () async {
      final mockResponse = '''
        {
          "location": {
            "name": "Joinville",
            "region": "Santa Catarina", 
            "country": "Brazil"
          },
          "current": {
            "temp_c": 25.94,
            "condition": {
              "text": "Cloudy",
              "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
              "code": 1003
            },
            "pressure_mb": 1012.0,
            "pressure_in": 29.88,
            "humidity": 97
          },
          "forecast": {
            "forecastday": []
          }
        }
      ''';

      when(
        () => mockClient.get(any()),
      ).thenAnswer((_) async => http.Response(mockResponse, 200));

      final result = await weatherService.getCurrentWeatherForCity(
        cityName: 'Joinville',
      );

      expect(result, isA<WeatherResponse>());
      expect(result.location.name, equals('Joinville'));
      expect(result.current.tempC, equals(25.94));
      expect(result.current.pressureMb, equals(1012.0));
      expect(result.current.humidity, equals(97));
    });

    test('GIVEN an unsuccessful API call '
        'WHEN getting current weather for city '
        'THEN throw exception', () async {
      when(
        () => mockClient.get(any()),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(
        () => weatherService.getCurrentWeatherForCity(cityName: 'Joinville'),
        throwsException,
      );
    });
  });
}
