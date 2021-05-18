import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:take_my_child/models/parents.model.dart';

class ResponsavelRepository {
  Future<dynamic> verificarLogin(String login) async {
    /*var url = Uri.parse(
        "https://3000-harlequin-wildcat-7ivobsaz.ws-us04.gitpod.io/verificarlogin/$login");*/
    var url = Uri.parse(
        "https://take-my-child-api.herokuapp.com/verificarlogin/$login");
    var resposta = await http.get(url);
    return resposta.body;
  }

  Future<dynamic> cadastrarAlunos(ParentsModel pais) async {
    /*var url = Uri.parse(
        "https://3000-harlequin-wildcat-7ivobsaz.ws-us04.gitpod.io/cadastrarmotorista");*/
    String url =
        'https://take-my-child-api.herokuapp.com/cadastrarresponsaveis';
    print(jsonEncode(pais.toJson()));

    var response = await http.post(
      url,
      body: jsonEncode(pais.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response.body;
  }
}
