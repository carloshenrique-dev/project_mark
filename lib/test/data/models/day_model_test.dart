import 'package:flutter_test/flutter_test.dart';
import 'package:project_mark/src/data/models/day_model.dart';
import 'package:project_mark/src/data/models/condition_model.dart';

void main() {
  group('DayModel', () {
    test('should create a DayModel from valid JSON', () {
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

    test('should throw an error when required fields are missing', () {
      final json = {
        'maxtemp_c': 25.5,
        // mintemp_c is missing
        'condition': {
          'text': 'Sunny',
          'icon': '//cdn.weatherapi.com/weather/64x64/day/113.png',
          'code': 1000,
        },
      };

      expect(() => DayModel.fromJson(json), throwsA(isA<Error>()));
    });

    test('should handle null values in JSON', () {
      final json = {'maxtemp_c': null, 'mintemp_c': null, 'condition': null};

      expect(() => DayModel.fromJson(json), throwsA(isA<Error>()));
    });
  });
}
