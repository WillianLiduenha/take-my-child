import 'dart:convert';

import 'package:take_my_child/models/user.model.dart';

class DriverModel {
   UserModel user;
   String cnh;
   String plate_van;
   String model_van;
   String color_van;
   String brand_van;

  DriverModel(
    this.user,
    this.cnh,
    this.plate_van,
    this.model_van,
    this.color_van,
    this.brand_van,
  );

  DriverModel.fromJson(Map<String, dynamic> json) {
    user = UserModel.fromJson(json);
    cnh = json['cnh'];
    plate_van = json['plate_van'];
    model_van = json['model_van'];
    color_van = json['color_van'];
    brand_van = json['brand_van'];
  }

  Map<String, dynamic> toJson() {
    return {
      "user": user.toJson(),
      "cnh": cnh,
      "plate_van": plate_van,
      "model_van": model_van,
      "color_van": color_van,
      "brand_van": brand_van
    };
  }

}
