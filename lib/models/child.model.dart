import 'dart:convert';

class ChildModel {
  final String name;
  final String school;
  final String addressSchool;
  final String route;

  ChildModel(
    this.name,
    this.school,
    this.addressSchool,
    this.route,
  );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'school': school,
      'addressSchool': addressSchool,
      'route': route,
    };
  }

  factory ChildModel.fromMap(Map<String, dynamic> map) {
    return ChildModel(
      map['name'],
      map['school'],
      map['addressSchool'],
      map['route'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChildModel.fromJson(String source) =>
      ChildModel.fromMap(json.decode(source));
}
