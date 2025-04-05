import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../di/weather_dependencies.dart';
import '../controllers/weather_controller.dart';
import '../utils/weather_status.dart';
import '../widgets/weather_app_bar.dart';
import '../widgets/weather_card.dart';
import '../widgets/weather_forecast_list.dart';
import '../widgets/current_weather_info.dart';

class WeatherPage extends GetView<WeatherController> {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.white,
      body: GetX<WeatherController>(
        init: getIt.get(),
        builder:
            (controller) => switch (controller.status.value) {
              WeatherPageStatus.loading || WeatherPageStatus.initial =>
                const Center(child: CircularProgressIndicator()),
              WeatherPageStatus.error => Center(
                child: Text(controller.error.value),
              ),
              WeatherPageStatus.success => PageView.builder(
                itemCount: controller.weatherData.value.length,
                itemBuilder: (context, cityIndex) {
                  final weatherEntity = controller.weatherData.value[cityIndex];

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WeatherCard(weatherEntity: weatherEntity),
                        CurrentWeatherInfo(weatherEntity: weatherEntity),
                        WeatherForecastList(weatherEntity: weatherEntity),
                      ],
                    ),
                  );
                },
              ),
            },
      ),
    );
  }
}
