import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:take_my_child/models/absent.model.dart';
import 'package:take_my_child/views/ausencia_aluno.dart';

class AbsentRepository {
  Future<dynamic> cadastrarAusente(AbsentModel ausente) async {
    /*var url = Uri.parse(
        "https://3000-harlequin-wildcat-7ivobsaz.ws-us04.gitpod.io/cadastrarmotorista");*/
    String url = 'https://take-my-child-api.herokuapp.com/createausente';
    print(jsonEncode(ausente.toJson()));

    /*var response = await http.post(
      url,
      body: jsonEncode(ausente.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return response.body;*/
  }
}
