class ShiftModel {
  String id;
  String cod_aluno;
  String cod_driver;
  int shift;
  int shift_status;

  AbsentModel();

  AbsentModel.fromJson(Map<String, dynamic> json) {
    id = json['uuid'];
    cod_aluno = json['aluno_codigo'];
    cod_driver = json['motorista_codigo'];
    shift = json['turno'];
    shift_status = json['status_turno'];
  }

  Map<String, dynamic> toJson() {
    return {
      "aluno_codigo": cod_aluno,
      "motorista_codigo": cod_driver,
      "turno": shift,
      "status_turno": shift_status
    };
  }
}
