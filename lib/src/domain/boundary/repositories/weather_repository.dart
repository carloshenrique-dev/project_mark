import '../../entities/weather_entity.dart';

abstract class IWeatherRepository {
  Future<WeatherEntity> getWeatherForCity(String cityName);
  Future<WeatherEntity> getCurrentWeatherForCity(String cityName);
}
