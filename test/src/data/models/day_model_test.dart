import 'package:flutter_test/flutter_test.dart';
import 'package:project_mark/src/data/models/condition_model.dart';
import 'package:project_mark/src/data/models/day_model.dart';

void main() {
  group('DayModel', () {
    test('GIVEN a valid JSON '
        'WHEN creating DayModel '
        'THEN return DayModel with correct values', () {
      final json = {
        'maxtemp_c': 25.5,
        'mintemp_c': 15.2,
        'condition': {
          'text': 'Sunny',
          'icon': '//cdn.weatherapi.com/weather/64x64/day/113.png',
          'code': 1000,
        },
      };

      final dayModel = DayModel.fromJson(json);

      expect(dayModel.maxtempC, equals(25.5));
      expect(dayModel.mintempC, equals(15.2));
      expect(dayModel.condition, isA<ConditionModel>());
      expect(dayModel.condition.text, equals('Sunny'));
    });

    test('GIVEN a JSON with missing fields '
        'WHEN creating DayModel '
        'THEN throw Error', () {
      final json = {
        'maxtemp_c': 25.5,
        'condition': {
          'text': 'Sunny',
          'icon': '//cdn.weatherapi.com/weather/64x64/day/113.png',
          'code': 1000,
        },
      };

      expect(() => DayModel.fromJson(json), throwsA(isA<Error>()));
    });

    test('GIVEN a JSON with null values '
        'WHEN creating DayModel '
        'THEN throw Error', () {
      final json = {'maxtemp_c': null, 'mintemp_c': null, 'condition': null};

      expect(() => DayModel.fromJson(json), throwsA(isA<Error>()));
    });
  });
}
