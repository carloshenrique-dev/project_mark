import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project_mark/src/data/models/condition_model.dart';
import 'package:project_mark/src/data/models/current_weather_model.dart';
import 'package:project_mark/src/data/models/location_model.dart';
import 'package:project_mark/src/data/models/weather_response.dart';
import 'package:project_mark/src/data/repositories/weather_repository_impl.dart';
import 'package:project_mark/src/data/services/weather_service.dart';
import 'package:project_mark/src/domain/entities/weather_entity.dart';

class MockWeatherService extends Mock implements IWeatherService {}

void main() {
  late WeatherRepository repository;
  late MockWeatherService mockService;

  setUp(() {
    mockService = MockWeatherService();
    repository = WeatherRepository(mockService);
  });

  group('WeatherRepository', () {
    test('GIVEN a successful API call '
        'WHEN getting weather for city '
        'THEN return WeatherEntity with correct data', () async {
      final mockResponse = WeatherResponse(
        location: LocationModel(name: 'Test City', region: 'Test Region'),
        current: CurrentWeatherModel(
          tempC: 25.0,
          condition: ConditionModel(
            text: 'Sunny',
            icon: 'test_icon',
            code: 1000,
          ),
          pressureMb: 1013.0,
          pressureIn: 29.92,
          humidity: 65,
        ),
        forecast: [],
      );

      when(
        () => mockService.getWeatherForCity(cityName: any(named: 'cityName')),
      ).thenAnswer((_) async => mockResponse);

      final result = await repository.getWeatherForCity('Test City');

      expect(result, isA<WeatherEntity>());
      expect(result.location.name, equals('Test City'));
      verify(
        () => mockService.getWeatherForCity(cityName: 'Test City'),
      ).called(1);
    });

    test('GIVEN a successful API call '
        'WHEN getting current weather for city '
        'THEN return WeatherEntity with correct data', () async {
      final mockResponse = WeatherResponse(
        location: LocationModel(name: 'Test City', region: 'Test Region'),
        current: CurrentWeatherModel(
          tempC: 25.0,
          condition: ConditionModel(
            text: 'Sunny',
            icon: 'test_icon',
            code: 1000,
          ),
          pressureMb: 1013.0,
          pressureIn: 29.92,
          humidity: 65,
        ),
        forecast: [],
      );

      when(
        () => mockService.getCurrentWeatherForCity(
          cityName: any(named: 'cityName'),
        ),
      ).thenAnswer((_) async => mockResponse);

      final result = await repository.getCurrentWeatherForCity('Test City');

      expect(result, isA<WeatherEntity>());
      expect(result.location.name, equals('Test City'));
      verify(
        () => mockService.getCurrentWeatherForCity(cityName: 'Test City'),
      ).called(1);
    });

    test('GIVEN an unsuccessful API call '
        'WHEN getting weather for city '
        'THEN throw exception', () async {
      when(
        () => mockService.getWeatherForCity(cityName: any(named: 'cityName')),
      ).thenThrow(Exception('Service error'));

      expect(() => repository.getWeatherForCity('Test City'), throwsException);
    });

    test('GIVEN an unsuccessful API call '
        'WHEN getting current weather for city '
        'THEN throw exception', () async {
      when(
        () => mockService.getCurrentWeatherForCity(
          cityName: any(named: 'cityName'),
        ),
      ).thenThrow(Exception('Service error'));

      expect(
        () => repository.getCurrentWeatherForCity('Test City'),
        throwsException,
      );
    });
  });
}
