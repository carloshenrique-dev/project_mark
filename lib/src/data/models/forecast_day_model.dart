import 'day_model.dart';
import 'hour_model.dart';

class ForecastDayModel {
  final String date;
  final int dateEpoch;
  final DayModel day;
  final List<HourModel> hour;

  ForecastDayModel({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.hour,
  });

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) {
    return ForecastDayModel(
      date: json['date'],
      dateEpoch: json['date_epoch'],
      day: DayModel.fromJson(json['day']),
      hour:
          (json['hour'] as List)
              .map((hour) => HourModel.fromJson(hour))
              .toList(),
    );
  }
}
