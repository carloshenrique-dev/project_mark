import '../../domain/entities/forecast_day_entity.dart';
import '../../domain/entities/location_entity.dart';
import '../../domain/entities/current_weather_entity.dart';
import '../../domain/entities/condition_entity.dart';
import '../../domain/entities/hour_entity.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/entities/day_entity.dart';
import 'current_weather_model.dart';
import 'forecast_day_model.dart';
import 'location_model.dart';

class WeatherResponse {
  final LocationModel location;
  final CurrentWeatherModel current;
  final List<ForecastDayModel> forecast;

  WeatherResponse({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      location: LocationModel.fromJson(json['location']),
      current: CurrentWeatherModel.fromJson(json['current']),
      forecast:
          (json['forecast']?['forecastday'] as List<dynamic>?)
              ?.map((day) => ForecastDayModel.fromJson(day))
              .toList() ??
          [],
    );
  }

  static WeatherEntity toEntity(WeatherResponse response) {
    return WeatherEntity(
      location: LocationEntity(
        name: response.location.name,
        region: response.location.region,
      ),
      current: CurrentWeatherEntity(
        tempC: response.current.tempC,
        condition: ConditionEntity(
          text: response.current.condition.text,
          icon: response.current.condition.icon,
          code: response.current.condition.code,
        ),
        pressureMb: response.current.pressureMb,
        pressureIn: response.current.pressureIn,
        humidity: response.current.humidity,
      ),
      forecast:
          response.forecast
              .map(
                (forecast) => ForecastDayEntity(
                  date: forecast.date,
                  day: DayEntity(
                    maxtempC: forecast.day.maxtempC,
                    mintempC: forecast.day.mintempC,
                    condition: ConditionEntity(
                      text: forecast.day.condition.text,
                      icon: forecast.day.condition.icon,
                      code: forecast.day.condition.code,
                    ),
                  ),
                  hour:
                      forecast.hour
                          .map(
                            (hour) => HourEntity(
                              time: hour.time,
                              tempC: hour.tempC,
                              pressureMb: hour.pressureMb,
                              pressureIn: hour.pressureIn,
                              condition: ConditionEntity(
                                text: hour.condition.text,
                                icon: hour.condition.icon,
                                code: hour.condition.code,
                              ),
                            ),
                          )
                          .toList(),
                ),
              )
              .toList(),
    );
  }
}
