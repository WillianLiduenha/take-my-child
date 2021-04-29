import 'dart:convert';

import 'package:take_my_child/models/user.model.dart';
import 'package:take_my_child/models/van.model.dart';

class DriverModel {
  final UserModel user;
  final VanModel van;
  final String cnh;

  DriverModel(
    this.user,
    this.van,
    this.cnh,
  );

  Map<String, dynamic> toMap() {
    return {
      'user': user.toMap(),
      'van': van.toMap(),
      'cnh': cnh,
    };
  }

  factory DriverModel.fromMap(Map<String, dynamic> map) {
    return DriverModel(
      UserModel.fromMap(map['user']),
      VanModel.fromMap(map['van']),
      map['cnh'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverModel.fromJson(String source) =>
      DriverModel.fromMap(json.decode(source));
}
