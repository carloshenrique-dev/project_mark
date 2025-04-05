import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_mark/src/data/models/weather_response.dart';
import '../../constants/weather_service_constants.dart';

abstract interface class IWeatherService {
  Future<WeatherResponse> getWeatherForCity({required String cityName});
  Future<WeatherResponse> getCurrentWeatherForCity({required String cityName});
}

class WeatherService implements IWeatherService {
  final http.Client client;

  WeatherService({http.Client? client}) : client = client ?? http.Client();

  @override
  Future<WeatherResponse> getWeatherForCity({required String cityName}) async {
    const int maxRetries = 3;
    int retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        final String url =
            '${WeatherServiceConstants.baseUrl}/forecast.json?key=${WeatherServiceConstants.apiKey}&q=$cityName&days=8';

        final response = await client.get(Uri.parse(url));

        if (response.statusCode == 200) {
          final Map<String, dynamic> jsonResponse = json.decode(response.body);
          return WeatherResponse.fromJson(jsonResponse);
        } else {
          throw Exception(
            'Failed to load weather data: ${response.statusCode}',
          );
        }
      } catch (e, s) {
        retryCount++;
        if (retryCount >= maxRetries) {
          throw Exception(
            'Error fetching weather data after $maxRetries retries: $e $s',
          );
        }
        await Future.delayed(const Duration(milliseconds: 200));
      }
    }

    throw Exception('Unexpected error occurred while fetching weather data.');
  }

  @override
  Future<WeatherResponse> getCurrentWeatherForCity({
    required String cityName,
  }) async {
    const int maxRetries = 3;
    int retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        final String url =
            '${WeatherServiceConstants.baseUrl}/current.json?key=${WeatherServiceConstants.apiKey}&q=$cityName&aqi=no';

        final response = await client.get(Uri.parse(url));

        if (response.statusCode == 200) {
          final Map<String, dynamic> jsonResponse = json.decode(response.body);
          return WeatherResponse.fromJson(jsonResponse);
        } else {
          throw Exception(
            'Failed to load current weather data: ${response.statusCode}',
          );
        }
      } catch (e, s) {
        retryCount++;
        if (retryCount >= maxRetries) {
          throw Exception(
            'Error fetching weather data after $maxRetries retries: $e $s',
          );
        }
        await Future.delayed(const Duration(milliseconds: 200));
      }
    }

    throw Exception('Unexpected error occurred while fetching weather data.');
  }
}
