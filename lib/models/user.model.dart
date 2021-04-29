import 'dart:convert';

class UserModel {
  final String id;
  final String name;
  final String login;
  final String password;
  final String cpf;
  final String rg;
  final String telephone;
  
  UserModel({
    this.id,
    this.name,
    this.login,
    this.password,
    this.cpf,
    this.rg,
    this.telephone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'login': login,
      'password': password,
      'cpf': cpf,
      'rg': rg,
      'telephone': telephone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      login: map['login'],
      password: map['password'],
      cpf: map['cpf'],
      rg: map['rg'],
      telephone: map['telephone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
