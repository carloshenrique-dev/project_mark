import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project_mark/src/domain/boundary/repositories/weather_repository.dart';
import 'package:project_mark/src/domain/entities/condition_entity.dart';
import 'package:project_mark/src/domain/entities/current_weather_entity.dart';
import 'package:project_mark/src/domain/entities/location_entity.dart';
import 'package:project_mark/src/domain/entities/weather_entity.dart';
import 'package:project_mark/src/presentation/controllers/weather_controller.dart';
import 'package:project_mark/src/presentation/utils/weather_status.dart';

class MockWeatherRepository extends Mock implements IWeatherRepository {}

void main() {
  late WeatherController controller;
  late MockWeatherRepository mockRepository;

  setUp(() {
    mockRepository = MockWeatherRepository();
    controller = WeatherController(mockRepository);
  });

  group('WeatherController Tests', () {
    test('GIVEN a new controller '
        'WHEN checking initial state '
        'THEN status should be initial', () {
      expect(controller.status.value, equals(WeatherPageStatus.initial));
    });

    test('GIVEN a successful repository response '
        'WHEN fetching weather data '
        'THEN update status to success with correct data', () async {
      final mockWeather = WeatherEntity(
        location: LocationEntity(name: 'Test City', region: 'Test Region'),
        current: CurrentWeatherEntity(
          tempC: 25.0,
          condition: ConditionEntity(
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
        () => mockRepository.getWeatherForCity(any()),
      ).thenAnswer((_) async => mockWeather);

      await controller.fetchWeatherData();

      expect(controller.status.value, equals(WeatherPageStatus.success));
      expect(controller.weatherData.value.length, equals(3));
      expect(controller.error.value, isEmpty);
    });

    test('GIVEN a failed repository response '
        'WHEN fetching weather data '
        'THEN update status to error with message', () async {
      when(
        () => mockRepository.getWeatherForCity(any()),
      ).thenThrow(Exception('Test error'));

      await controller.fetchWeatherData();

      expect(controller.status.value, equals(WeatherPageStatus.error));
      expect(controller.error.value, contains('Test error'));
    });

    test('GIVEN a page number '
        'WHEN updating current page '
        'THEN current page value should be updated', () {
      controller.updateCurrentPage(2);

      expect(controller.currentPage.value, equals(2));
    });
  });
}
