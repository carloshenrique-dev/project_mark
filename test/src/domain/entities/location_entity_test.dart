import 'package:flutter_test/flutter_test.dart';
import 'package:project_mark/src/domain/entities/location_entity.dart';

void main() {
  group('LocationEntity', () {
    test('GIVEN a region with multiple words '
        'WHEN splitRegion is called '
        'THEN it returns the initials of each word in uppercase', () {
      final location = LocationEntity(
        name: 'Test Location',
        region: 'New York',
      );
      expect(location.splitRegion, 'NY');
    });

    test('GIVEN a region with a single word and length greater than 1 '
        'WHEN splitRegion is called '
        'THEN it returns the first two letters in uppercase', () {
      final location = LocationEntity(name: 'Test Location', region: 'Texas');
      expect(location.splitRegion, 'TE');
    });

    test('GIVEN a region with a single word and length equal to 1 '
        'WHEN splitRegion is called '
        'THEN it returns the single letter in uppercase', () {
      final location = LocationEntity(name: 'Test Location', region: 'A');
      expect(location.splitRegion, 'A');
    });

    test('GIVEN a region with mixed case letters '
        'WHEN splitRegion is called '
        'THEN it returns the initials in uppercase', () {
      final location = LocationEntity(
        name: 'Test Location',
        region: 'nEw YoRk',
      );
      expect(location.splitRegion, 'NY');
    });

    test('GIVEN an empty region '
        'WHEN splitRegion is called '
        'THEN it throws a RangeError', () {
      final location = LocationEntity(name: 'Test Location', region: '');
      expect(() => location.splitRegion, throwsRangeError);
    });
  });
}
