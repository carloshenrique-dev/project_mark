class LocationEntity {
  final String name;
  final String region;

  LocationEntity({required this.name, required this.region});

  String get splitRegion {
    final words = region.split(' ');
    if (words.length > 1) {
      return words.map((word) => word[0].toUpperCase()).join('');
    } else {
      return region[0].toUpperCase();
    }
  }
}
