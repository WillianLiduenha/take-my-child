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
}
