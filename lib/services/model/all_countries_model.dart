class AllCountriesModel {
  final int id;
  final String name;
  final String iSO2;
  final String iSO3;
  final String phoneCode;
  String? capital;
  final String currency;
  String? native;
  final String emoji;

  AllCountriesModel({
    required this.id,
    required this.name,
    required this.iSO2,
    required this.iSO3,
    required this.phoneCode,
    this.capital,
    required this.currency,
    this.native,
    required this.emoji,
  });

  factory AllCountriesModel.fromJson(Map<String, dynamic> json) {
    return AllCountriesModel(
      id: json['id'],
      name: json['name'],
      iSO2: json['iso2'],
      iSO3: json['iso3'],
      phoneCode: json['phonecode'],
      capital: json['capital'],
      currency: json['currency'],
      native: json['native'],
      emoji: json['emoji'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'iso2': iSO2,
      'iso3': iSO3,
      'phonecode': phoneCode,
      'capital': capital,
      'currency': currency,
      'native': native,
      'emoji': emoji,
    };
  }
}
