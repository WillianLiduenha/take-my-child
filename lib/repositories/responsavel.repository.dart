import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:take_my_child/models/parents.model.dart';

class ResponsavelRepository {
  ParentsModel _responsaveis = new ParentsModel();

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

  Future<ParentsModel> lerAluno(String login) async {
    /*var url = Uri.parse(
        "https://3000-indigo-lynx-4p0wwhth.ws-us04.gitpod.io/readaluno/$login");*/
    String url = "https://take-my-child-api.herokuapp.com/readaluno/$login";
    var response = await http.get(url);
    print(response.body);

    var res = jsonDecode(response.body);
    _responsaveis = ParentsModel.fromJson(res[0]);
    print(_responsaveis.user.cpf);
    //moto.map((objeto) => this._motorista = DriverModel.fromJson(objeto));
    return _responsaveis;
  }
}
