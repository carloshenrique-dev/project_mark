import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project_mark/src/domain/boundary/repositories/weather_repository.dart';
import 'package:project_mark/src/presentation/controllers/weather_controller.dart';
import 'package:project_mark/src/presentation/pages/weather_page.dart';

class MockWeatherRepository extends Mock implements IWeatherRepository {}

void main() {
  late WeatherController controller;
  late MockWeatherRepository mockRepository;
  final getIt = GetIt.instance;

  setUp(() {
    mockRepository = MockWeatherRepository();
    controller = WeatherController(mockRepository);
    getIt.registerSingleton<WeatherController>(controller);
  });

  tearDown(() {
    getIt.reset();
  });

  testWidgets('GIVEN initial state '
      'WHEN rendering WeatherPage '
      'THEN show initial content', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: WeatherPage()));

    expect(find.byType(WeatherPage), findsOneWidget);
  });
}
