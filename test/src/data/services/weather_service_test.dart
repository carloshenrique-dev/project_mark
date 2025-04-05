import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:project_mark/src/constants/weather_service_constants.dart';
import 'package:project_mark/src/data/models/city_weather.dart';
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

  group('getWeatherForCities', () {
    test('GIVEN a successful API call '
        'WHEN getting weather for cities '
        'THEN return WeatherResponse with correct data ', () async {
      final mockResponse = '''
        {
          "cnt": 3,
          "list": [
            {
              "coord": {"lon": -48.8456, "lat": -26.3044},
              "sys": {"country": "BR", "timezone": -10800},
              "weather": [{"id": 804, "main": "Clouds", "description": "overcast clouds", "icon": "04d"}],
              "main": {"temp": 25.94, "pressure": 1012, "humidity": 97},
              "visibility": 10000,
              "wind": {"speed": 0.3, "deg": 236},
              "clouds": {"all": 96},
              "dt": 1743678548,
              "id": 3459712,
              "name": "Joinville"
            }
          ]
        }
      ''';

      when(
        () => mockClient.get(any()),
      ).thenAnswer((_) async => http.Response(mockResponse, 200));

      final result = await weatherService.getWeatherForCities([3459712]);

      expect(result, isA<WeatherResponse>());
      expect(result.count, equals(3));
      expect(result.cities.length, equals(1));
      expect(result.cities.first.name, equals('Joinville'));
      expect(result.cities.first.country, equals('BR'));
      expect(result.cities.first.weather.temp, equals(25.94));
      expect(result.cities.first.weather.pressure, equals(1012));
      expect(result.cities.first.weather.humidity, equals(97));
    });

    test('GIVEN an unsuccessful API call'
        'WHEN getting weather for cities'
        'THEN throw exception', () async {
      when(
        () => mockClient.get(any()),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(
        () => weatherService.getWeatherForCities([3459712]),
        throwsException,
      );
    });
  });

  group('getWeatherForCity', () {
    test('GIVEN a successful API call'
        'WHEN getting weather for a single city'
        'THEN return CityWeather with correct data', () async {
      final mockResponse = '''
        {
          "coord": {"lon": -48.8456, "lat": -26.3044},
          "sys": {"country": "BR", "timezone": -10800},
          "weather": [{"id": 804, "main": "Clouds", "description": "overcast clouds", "icon": "04d"}],
          "main": {"temp": 25.94, "pressure": 1012, "humidity": 97},
          "visibility": 10000,
          "wind": {"speed": 0.3, "deg": 236},
          "clouds": {"all": 96},
          "dt": 1743678548,
          "id": 3459712,
          "name": "Joinville"
        }
      ''';

      when(
        () => mockClient.get(any()),
      ).thenAnswer((_) async => http.Response(mockResponse, 200));

      final result = await weatherService.getWeatherForCity(3459712);

      expect(result, isA<CityWeather>());
      expect(result.name, equals('Joinville'));
      expect(result.country, equals('BR'));
      expect(result.weather.temp, equals(25.94));
      expect(result.weather.pressure, equals(1012));
      expect(result.weather.humidity, equals(97));
    });

    test('GIVEN an unsuccessful API call'
        'WHEN getting weather for a single city'
        'THEN throw exception', () async {
      when(
        () => mockClient.get(any()),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(() => weatherService.getWeatherForCity(3459712), throwsException);
    });
  });
}
