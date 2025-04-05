import 'package:get/get.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/boundary/repositories/weather_repository.dart';
import '../utils/cities.dart';
import '../utils/weather_status.dart';

final class WeatherController extends GetxController {
  final IWeatherRepository _repository;
  final Rx<List<WeatherEntity>> weatherData = Rx<List<WeatherEntity>>([]);
  final Rx<WeatherPageStatus> status = WeatherPageStatus.initial.obs;
  final RxString error = ''.obs;

  WeatherController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _fetchWeatherData();
    _fetchCurrentWeatherPeriodically();
  }

  void _fetchCurrentWeatherPeriodically() {
    Future.delayed(const Duration(minutes: 10), () {
      _fetchCurrentWeather();
      _fetchCurrentWeatherPeriodically();
    });
  }

  Future<void> _fetchWeatherData() async {
    try {
      status.value = WeatherPageStatus.loading;
      error.value = '';

      final cities = Cities.cities;
      final cityWeatherList = await Future.wait(
        cities.map((city) => _repository.getWeatherForCity(city)),
      );

      weatherData.value = cityWeatherList;
      status.value = WeatherPageStatus.success;
    } catch (e) {
      error.value = 'Error fetching weather data: $e';
      status.value = WeatherPageStatus.error;
    }
  }

  Future<void> _fetchCurrentWeather() async {
    try {
      final cities = Cities.cities;
      final updatedWeatherList = <WeatherEntity>[];

      for (final city in cities) {
        final currentWeather = await _repository.getCurrentWeatherForCity(city);
        final index = weatherData.value.indexWhere(
          (weather) => weather.location.name == currentWeather.location.name,
        );

        if (index != -1) {
          updatedWeatherList.add(
            WeatherEntity(
              location: currentWeather.location,
              current: currentWeather.current,
              forecast: weatherData.value[index].forecast,
            ),
          );
        }
      }

      if (updatedWeatherList.isNotEmpty) {
        weatherData.value = updatedWeatherList;
      }
    } catch (e) {
      error.value = 'Error updating current weather: $e';
      status.value = WeatherPageStatus.error;
    }
  }
}
