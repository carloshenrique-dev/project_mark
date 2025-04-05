import 'condition_entity.dart';

class DayEntity {
  final double maxtempC;
  final double mintempC;
  final ConditionEntity condition;

  DayEntity({
    required this.maxtempC,
    required this.mintempC,
    required this.condition,
  });
}
