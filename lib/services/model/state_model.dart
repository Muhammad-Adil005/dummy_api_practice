class StateModel {
  final int id;
  final String name;
  final String iso2;

  StateModel({
    required this.id,
    required this.name,
    required this.iso2,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      id: json['id'],
      name: json['name'],
      iso2: json['iso2'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'iso2': iso2,
    };
  }
}
