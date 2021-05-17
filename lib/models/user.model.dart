import 'dart:convert';

class UserModel {
  String id;
  String name;
  String login;
  String password;
  String cpf;
  String rg;
  String telephone;

  UserModel({
    this.id,
    this.name,
    this.login,
    this.password,
    this.cpf,
    this.rg,
    this.telephone,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    login = json['login'];
    password = json['password'];
    cpf = json['cpf'];
    rg = json['rg'];
    telephone = json['telephone'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "login": login,
      "password": password,
      "cpf": cpf,
      "rg": rg,
      "telephone": telephone
    };
  }
}
