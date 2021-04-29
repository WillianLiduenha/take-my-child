import 'dart:convert';

class UserModel {
  final String id;
  final String name;
  final String cpf;
  final String rg;
  final String telephone;
  UserModel({
    this.id,
    this.name,
    this.cpf,
    this.rg,
    this.telephone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'cpf': cpf,
      'rg': rg,
      'telephone': telephone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      cpf: map['cpf'],
      rg: map['rg'],
      telephone: map['telephone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
