import 'dart:convert';

class UserModel {
  String id;
  String name;
  String login;
  String password;
  String cpf;
  String rg;
  String telephone;
  String email;

  /*UserModel({
    this.id,
    this.name,
    this.login,
    this.password,
    this.cpf,
    this.rg,
    this.telephone,
  });*/

  UserModel();

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['uuid'];
    name = json['nome_usuario'];
    login = json['usuario_login'];
    password = json['usuario_password'];
    cpf = json['cpf'];
    rg = json['rg'];
    telephone = json['telefone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    return {
      "nome": name,
      "login": login,
      "senha": password,
      "cpf": cpf,
      "rg": rg,
      "telefone": telephone,
      "email": email
    };
  }
}
