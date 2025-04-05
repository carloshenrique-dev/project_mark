import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:project_mark/src/data/repositories/weather_repository_impl.dart';
import 'package:project_mark/src/data/services/weather_service.dart';
import 'package:project_mark/src/di/weather_dependencies.dart';
import 'package:project_mark/src/domain/boundary/repositories/weather_repository.dart';
import 'package:project_mark/src/presentation/controllers/weather_controller.dart';

void main() {
  final getIt = GetIt.instance;

  setUp(() {
    getIt.reset();
  });

  test('GIVEN initialized dependencies '
      'WHEN checking registered dependencies '
      'THEN all dependencies are registered correctly', () {
    initializeDependencies();

    // Verify external dependencies
    expect(getIt<http.Client>(), isA<http.Client>());

    // Verify services
    expect(getIt<IWeatherService>(), isA<WeatherService>());

    // Verify repositories
    expect(getIt<IWeatherRepository>(), isA<WeatherRepository>());

    // Verify controllers
    expect(getIt<WeatherController>(), isA<WeatherController>());
  });

  test('GIVEN initialized dependencies '
      'WHEN WeatherService is retrieved '
      'THEN it uses the registered http.Client', () {
    initializeDependencies();

    final weatherService = getIt<IWeatherService>() as WeatherService;
    expect(weatherService.client, isA<http.Client>());
  });
}
