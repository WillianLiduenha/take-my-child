import 'dart:convert';

class ChildModel {
  final String school;
  final bool go;

  ChildModel(this.school, this.go);
  

  Map<String, dynamic> toMap() {
    return {
      'school': school,
      'go': go,
    };
  }

  factory ChildModel.fromMap(Map<String, dynamic> map) {
    return ChildModel(
      map['school'],
      map['go'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChildModel.fromJson(String source) => ChildModel.fromMap(json.decode(source));
}
