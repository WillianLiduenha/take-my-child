import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:take_my_child/models/shift.model.dart';

class ShiftRepository {
  Future<List<ShiftModel>> iniciarTurno(
      String login_motorista, int turno) async {
    // var url =
    // Uri.parse("https://3000-salmon-sole-va6j67xo.ws-us08.gitpod.io/turno");
    String url = "https://take-my-child-api.herokuapp.com/turno";

    var json_body = '{"login_motorista":' +
        '"' +
        '$login_motorista' +
        '",' +
        '"turno":' +
        '"' +
        turno.toString() +
        '"}';
    print(json_body);

    var resposta = await http.post(
      url,
      body: json_body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(resposta.body);

    Iterable alunos = jsonDecode(resposta.body);
    //_responsavel = ParentsModel.fromJson(alunos[0]);
    var lista = alunos.map((objeto) => ShiftModel.fromJson(objeto));
    return lista.toList();
  }

  Future<dynamic> readTurnoFinalizado(String uuid_motorista) async {
    /*var url = Uri.parse(
        "https://3000-harlequin-wildcat-7ivobsaz.ws-us04.gitpod.io/verificarlogin/$login");*/
    var url = Uri.parse(
        "https://take-my-child-api.herokuapp.com/readturno/$uuid_motorista");
    var resposta = await http.get(url);

    if (resposta.statusCode == 401) {
      return null;
    } else {
      return resposta.body;
    }
  }

  Future<dynamic> updateStatus(ShiftModel aluno) async {
    /*var url = Uri.parse(
        "https://3000-harlequin-wildcat-7ivobsaz.ws-us04.gitpod.io/cadastrarmotorista");*/
    String url = "https://take-my-child-api.herokuapp.com/statusturno";
    print(jsonEncode(aluno.toJson()));

    var response = await http.put(
      url,
      body: jsonEncode(aluno.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response.body;
  }

  Future<void> deleteTurnoMotorista(String uuid_motorista) async {
    /*var url = Uri.parse(
        "https://3000-indigo-lynx-4p0wwhth.ws-us04.gitpod.io/readmotorista/$login");*/
    String url =
        "https://take-my-child-api.herokuapp.com/deleteturnomotorista/$uuid_motorista";
    var response = await http.delete(url);
  }

  Future<ShiftModel> readTurnoAluno(String login) async {
    /*var url = Uri.parse(
        "https://3000-harlequin-wildcat-7ivobsaz.ws-us04.gitpod.io/verificarlogin/$login");*/
    var url = Uri.parse(
        "https://take-my-child-api.herokuapp.com/readturnoaluno/$login");
    var resposta = await http.get(url);

    if (resposta.statusCode == 401) {
      return null;
    } else {
      ShiftModel aluno = new ShiftModel();
      var decode = jsonDecode(resposta.body);

      aluno = ShiftModel.fromJson(decode[0]);

      return aluno;
    }
  }
}
