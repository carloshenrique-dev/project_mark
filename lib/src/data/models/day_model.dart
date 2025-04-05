import 'condition_model.dart';

class DayModel {
  final double maxtempC;
  final double mintempC;
  final ConditionModel condition;

  DayModel({
    required this.maxtempC,
    required this.mintempC,
    required this.condition,
  });

  factory DayModel.fromJson(Map<String, dynamic> json) {
    return DayModel(
      maxtempC: json['maxtemp_c'],
      mintempC: json['mintemp_c'],
      condition: ConditionModel.fromJson(json['condition']),
    );
  }
}
