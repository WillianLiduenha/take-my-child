import 'dart:convert';

import 'package:take_my_child/models/child.model.dart';

class ParentsModel {
  final ChildModel child;
  final String address;

  ParentsModel(this.child, this.address);
  

  Map<String, dynamic> toMap() {
    return {
      'child': child.toMap(),
      'address': address,
    };
  }

  factory ParentsModel.fromMap(Map<String, dynamic> map) {
    return ParentsModel(
      ChildModel.fromMap(map['child']),
      map['address'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ParentsModel.fromJson(String source) => ParentsModel.fromMap(json.decode(source));
}
