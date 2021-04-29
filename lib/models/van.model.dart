import 'dart:convert';

class VanModel {
  final String plate;
  final String model;
  final String color;
  final String brand;

  VanModel({
    this.plate,
    this.model,
    this.color,
     this.brand,
  });

  Map<String, dynamic> toMap() {
    return {
      'plate': plate,
      'model': model,
      'color': color,
      'brand': brand,
    };
  }

  factory VanModel.fromMap(Map<String, dynamic> map) {
    return VanModel(
      plate: map['plate'],
      model: map['model'],
      color: map['color'],
      brand: map['brand'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VanModel.fromJson(String source) =>
      VanModel.fromMap(json.decode(source));
}
