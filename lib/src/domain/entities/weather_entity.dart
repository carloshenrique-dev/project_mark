import 'current_weather_entity.dart';
import 'forecast_day_entity.dart';
import 'location_entity.dart';

class WeatherEntity {
  final LocationEntity location;
  final CurrentWeatherEntity current;
  final List<ForecastDayEntity> forecast;

  WeatherEntity({
    required this.location,
    required this.current,
    required this.forecast,
  });
}
