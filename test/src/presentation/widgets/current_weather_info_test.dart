import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_mark/src/domain/entities/condition_entity.dart';
import 'package:project_mark/src/domain/entities/current_weather_entity.dart';
import 'package:project_mark/src/domain/entities/day_entity.dart';
import 'package:project_mark/src/domain/entities/forecast_day_entity.dart';
import 'package:project_mark/src/domain/entities/hour_entity.dart';
import 'package:project_mark/src/domain/entities/location_entity.dart';
import 'package:project_mark/src/domain/entities/weather_entity.dart';
import 'package:project_mark/src/presentation/widgets/current_weather_info.dart';

void main() {
  testWidgets('GIVEN a weather entity '
      'WHEN rendering CurrentWeatherInfo '
      'THEN show current weather details', (WidgetTester tester) async {
    final weatherEntity = WeatherEntity(
      location: LocationEntity(name: 'Test City', region: 'Test Region'),
      current: CurrentWeatherEntity(
        tempC: 25.0,
        condition: ConditionEntity(text: 'Sunny', icon: '01d', code: 1000),
        pressureMb: 1013.0,
        pressureIn: 29.92,
        humidity: 60,
      ),
      forecast: [
        ForecastDayEntity(
          hour: [
            HourEntity(
              pressureMb: 1013.0,
              pressureIn: 29.92,
              time: '2023-01-01',
              tempC: 25.0,
              condition: ConditionEntity(
                text: 'Sunny',
                icon: '01d',
                code: 1000,
              ),
            ),
          ],
          date: '2023-01-01',
          day: DayEntity(
            maxtempC: 25.0,
            mintempC: 20.0,
            condition: ConditionEntity(text: 'Sunny', icon: '01d', code: 1000),
          ),
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: CurrentWeatherInfo(weatherEntity: weatherEntity),
          ),
        ),
      ),
    );

    expect(find.text('Now'), findsOneWidget);
    expect(
      find.text('${weatherEntity.current.tempC.round()}°'),
      findsOneWidget,
    );
  });
}
