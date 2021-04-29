import 'dart:convert';

import 'package:take_my_child/models/child.model.dart';
import 'package:take_my_child/models/user.model.dart';

class ParentsModel {
  final UserModel user;
  final ChildModel child;
  final String address;
  final String codDriver;

  ParentsModel({
    this.user,
    this.child,
    this.address,
    this.codDriver,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': user.toMap(),
      'child': child.toMap(),
      'address': address,
      'codDriver': codDriver,
    };
  }

  factory ParentsModel.fromMap(Map<String, dynamic> map) {
    return ParentsModel(
      user: UserModel.fromMap(map['user']),
      child: ChildModel.fromMap(map['child']),
      address: map['address'],
      codDriver: map['codDriver'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ParentsModel.fromJson(String source) =>
      ParentsModel.fromMap(json.decode(source));
}
