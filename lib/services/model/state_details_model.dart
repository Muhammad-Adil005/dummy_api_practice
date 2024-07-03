class StateDetailsModel {
  final int id;
  final String name;
  final double latitude;
  final double longitude;

  StateDetailsModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory StateDetailsModel.fromJson(Map<String, dynamic> json) {
    return StateDetailsModel(
      id: json['id'],
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
