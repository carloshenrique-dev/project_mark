import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project_mark/src/domain/boundary/repositories/weather_repository.dart';
import 'package:project_mark/src/presentation/controllers/weather_controller.dart';
import 'package:project_mark/src/presentation/widgets/weather_error_widget.dart';

class MockWeatherRepository extends Mock implements IWeatherRepository {}

void main() {
  late WeatherController controller;
  late MockWeatherRepository mockRepository;

  setUp(() {
    mockRepository = MockWeatherRepository();
    controller = WeatherController(mockRepository);
    Get.put(controller);
  });

  tearDown(() {
    Get.reset();
  });

  testWidgets('GIVEN an error message '
      'WHEN rendering WeatherErrorWidget '
      'THEN show error message and retry button', (WidgetTester tester) async {
    const errorMessage = 'Test error message';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WeatherErrorWidget(
            weatherController: controller,
            errorMessage: errorMessage,
          ),
        ),
      ),
    );

    expect(find.text(errorMessage), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
