class ShiftModel {
  String cod_aluno;
  String cod_driver;
  String name_aluno;
  String adress_aluno;
  int shift;
  int shift_status;
  DateTime data;

  ShiftModel();

  ShiftModel.fromJson(Map<String, dynamic> json) {
    cod_aluno = json['aluno_codigo'];
    cod_driver = json['motorista_codigo'];
    name_aluno = json['aluno_nome'];
    adress_aluno = json['aluno_endereco'];
    shift = json['turno'];
    shift_status = json['status_turno'];
    //data = json['data'];
  }

  Map<String, dynamic> toJson() {
    return {
      "aluno_codigo": cod_aluno,
      "motorista_codigo": cod_driver,
      "aluno_nome": name_aluno,
      "aluno_endereco": adress_aluno,
      "turno": shift,
      "status": shift_status,
      "data": data.toString()
    };
  }
}
