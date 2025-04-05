import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../di/weather_dependencies.dart';
import '../controllers/weather_controller.dart';
import '../utils/weather_status.dart';
import '../widgets/weather_error_widget.dart';
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
      backgroundColor: AppColors.background,
      body: GetX<WeatherController>(
        init: getIt.get(),
        builder:
            (controller) => switch (controller.status.value) {
              WeatherPageStatus.loading ||
              WeatherPageStatus.initial => const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
              WeatherPageStatus.error => WeatherErrorWidget(
                weatherController: controller,
                errorMessage: controller.error.value,
              ),
              WeatherPageStatus.success => PageView.builder(
                onPageChanged: (index) => controller.updateCurrentPage(index),
                itemCount: controller.weatherData.value.length,
                itemBuilder: (context, cityIndex) {
                  final weatherEntity = controller.weatherData.value[cityIndex];

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WeatherCard(weatherEntity: weatherEntity),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            controller.weatherData.value.length,
                            (index) => Obx(
                              () => Container(
                                width: 8,
                                height: 8,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      controller.currentPage.value == index
                                          ? AppColors.primary
                                          : AppColors.inactiveDot,
                                ),
                              ),
                            ),
                          ),
                        ),
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
