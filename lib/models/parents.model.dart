import 'dart:convert';

import 'package:take_my_child/models/user.model.dart';

class ParentsModel {
  UserModel user = new UserModel();
  String address;
  String codDriver;
  String name;
  String school;
  String addressSchool;
  int route;

  /*ParentsModel({
    this.address,
    this.codDriver,
    this.name,
    this.school,
    this.addressSchool,
    this.route,
  });*/

  ParentsModel();

  ParentsModel.fromJson(Map<String, dynamic> json) {
    user = UserModel.fromJson(json);
    address = json['address'];
    codDriver = json['codDriver'];
    name = json['name'];
    school = json['school'];
    addressSchool = json['addressSchool'];
    route = json['route'];
  }

  Map<String, dynamic> toJson() {
    return {
      "user": user.toJson(),
      "address": address,
      "codDriver": codDriver,
      "name": name,
      "school": school,
      "addressSchool": addressSchool,
      "route": route
    };
  }
}
