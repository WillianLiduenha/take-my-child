class AbsentModel {
  String id;
  String cod_parents;
  int turno_ida;
  int turno_volta;
  DateTime date;

  AbsentModel();

  AbsentModel.fromJson(Map<String, dynamic> json) {
    id = json['uuid'];
    cod_parents = json['aluno_codigo'];
    turno_ida = json['turno_ida'];
    turno_volta = json['turno_volta'];
    date = json['data'];
  }

  Map<String, dynamic> toJson() {
    return {
      "aluno_codigo": cod_parents,
      "turno_ida": turno_ida,
      "turno_volta": turno_volta,
      "data": date.toString()
    };
  }
}
