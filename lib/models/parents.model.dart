import 'dart:convert';

import 'package:take_my_child/models/user.model.dart';

class ParentsModel {
  UserModel user = new UserModel();
  String address;
  String codDriver;
  String name_child;
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
    address = json['endereco'];
    codDriver = json['codigo_motorista'];
    name_child = json['nome_aluno'];
    school = json['escola'];
    addressSchool = json['endereco_escola'];
    route = json['trajeto'];
  }

  Map<String, dynamic> toJson() {
    return {
      "user": user.toJson(),
      "endereco": address,
      "codDriver": codDriver,
      "nome_aluno": name_child,
      "escola": school,
      "endereco_escola": addressSchool,
      "trajeto": route
    };
  }
}
