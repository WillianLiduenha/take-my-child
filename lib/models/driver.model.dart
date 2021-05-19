import 'dart:convert';

import 'package:take_my_child/models/user.model.dart';

class DriverModel {
  UserModel user = UserModel();
  String cnh;
  String plate_van;
  String model_van;
  String color_van;
  String brand_van;

  /*DriverModel(
    this.user,
    this.cnh,
    this.plate_van,
    this.model_van,
    this.color_van,
    this.brand_van,
  );*/
  DriverModel();

  DriverModel.fromJson(Map<String, dynamic> json) {
    user = UserModel.fromJson(json);
    cnh = json['cnh'];
    plate_van = json['placa_van'];
    model_van = json['modelo_van'];
    color_van = json['cor_van'];
    brand_van = json['marca_van'];
  }

  Map<String, dynamic> toJson() {
    return {
      "user": user.toJson(),
      "cnh": cnh,
      "placa_van": plate_van,
      "modelo_van": model_van,
      "cor_van": color_van,
      "marca_van": brand_van
    };
  }
}
