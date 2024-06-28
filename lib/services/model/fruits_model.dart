class FruitsModel {
  final int id;
  final String name;
  final String family;
  final String order;
  final String genus;
  final Nutrition nutritions;

  FruitsModel({
    required this.id,
    required this.name,
    required this.family,
    required this.order,
    required this.genus,
    required this.nutritions,
  });

  factory FruitsModel.fromJson(Map<String, dynamic> json) {
    return FruitsModel(
      id: json['id'],
      name: json['name'],
      family: json['family'],
      order: json['order'],
      genus: json['genus'],
      nutritions: Nutrition.fromJson(json['nutritions']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'family': family,
      'order': order,
      'genus': genus,
      'nutritions': nutritions.toJson(),
    };
  }
}

class Nutrition {
  final int calories;
  final double fat;
  final double sugar;
  final double carbohydrates;
  final double protein;

  Nutrition({
    required this.calories,
    required this.fat,
    required this.sugar,
    required this.carbohydrates,
    required this.protein,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
      calories: json['calories'],
      fat: json['fat'],
      sugar: json['sugar'],
      carbohydrates: json['carbohydrates'],
      protein: json['protein'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'fat': fat,
      'sugar': sugar,
      'carbohydrates': carbohydrates,
      'protein': protein,
    };
  }
}
