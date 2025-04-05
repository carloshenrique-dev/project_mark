class LocationModel {
  final String name;
  final String region;

  LocationModel({required this.name, required this.region});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(name: json['name'], region: json['region']);
  }
}
