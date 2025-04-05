import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_mark/src/domain/entities/condition_entity.dart';
import 'package:project_mark/src/domain/entities/current_weather_entity.dart';
import 'package:project_mark/src/domain/entities/location_entity.dart';
import 'package:project_mark/src/domain/entities/weather_entity.dart';
import 'package:project_mark/src/presentation/widgets/weather_card.dart';

void main() {
  testWidgets('GIVEN a weather entity '
      'WHEN rendering WeatherCard '
      'THEN show weather information correctly', (WidgetTester tester) async {
    final weatherEntity = WeatherEntity(
      location: LocationEntity(name: 'Test City', region: 'Test Region'),
      current: CurrentWeatherEntity(
        tempC: 25.0,
        condition: ConditionEntity(text: 'Sunny', icon: '01d', code: 1000),
        pressureMb: 1013.0,
        pressureIn: 29.92,
        humidity: 60,
      ),
      forecast: [],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: WeatherCard(weatherEntity: weatherEntity)),
      ),
    );

    await tester.pumpAndSettle();

    expect(
      find.text(
        '${weatherEntity.location.name} / ${weatherEntity.location.splitRegion}',
      ),
      findsOneWidget,
    );

    expect(
      find.text('${weatherEntity.current.tempC.round()}°C'),
      findsOneWidget,
    );

    expect(
      find.text('Humidity: ${weatherEntity.current.humidity}%'),
      findsOneWidget,
    );

    expect(
      find.text('Pressure: ${weatherEntity.current.pressureMb} hPa'),
      findsOneWidget,
    );
  });
}
