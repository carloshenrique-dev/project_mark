import 'dart:async';
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
  final RxInt currentPage = 0.obs;
  Timer? _currentWeatherTimer;

  WeatherController(this._repository);

  @override
  void onInit() {
    super.onInit();
    fetchWeatherData();
    _startCurrentWeatherTimer();
  }

  @override
  void onClose() {
    _currentWeatherTimer?.cancel();
    super.onClose();
  }

  void _startCurrentWeatherTimer() {
    _currentWeatherTimer?.cancel();
    _currentWeatherTimer = Timer.periodic(
      const Duration(minutes: 10),
      (_) => _fetchCurrentWeatherForSelectedCity(),
    );
  }

  void updateCurrentPage(int index) {
    currentPage.value = index;
    _startCurrentWeatherTimer();
  }

  Future<void> _fetchCurrentWeatherForSelectedCity() async {
    try {
      if (weatherData.value.isEmpty) return;

      final selectedCity = weatherData.value[currentPage.value].location.name;
      final currentWeather = await _repository.getCurrentWeatherForCity(
        selectedCity,
      );

      final updatedWeatherList = List<WeatherEntity>.from(weatherData.value);
      final index = updatedWeatherList.indexWhere(
        (weather) => weather.location.name == currentWeather.location.name,
      );

      if (index != -1) {
        updatedWeatherList[index] = WeatherEntity(
          location: currentWeather.location,
          current: currentWeather.current,
          forecast: weatherData.value[index].forecast,
        );
        weatherData.value = updatedWeatherList;
      }
    } catch (e) {
      error.value = 'Error updating current weather: $e';
      status.value = WeatherPageStatus.error;
    }
  }

  Future<void> fetchWeatherData() async {
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
}
