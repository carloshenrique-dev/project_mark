import '../../domain/entities/weather_entity.dart';
import '../../domain/boundary/repositories/weather_repository.dart';
import '../models/weather_response.dart';
import '../services/weather_service.dart';

class WeatherRepository implements IWeatherRepository {
  final IWeatherService _weatherService;

  WeatherRepository(this._weatherService);

  @override
  Future<WeatherEntity> getWeatherForCity(String cityName) async {
    final response = await _weatherService.getWeatherForCity(
      cityName: cityName,
    );
    return WeatherResponse.toEntity(response);
  }

  @override
  Future<WeatherEntity> getCurrentWeatherForCity(String cityName) async {
    final response = await _weatherService.getCurrentWeatherForCity(
      cityName: cityName,
    );
    return WeatherResponse.toEntity(response);
  }
}
