import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:take_my_child/models/driver.model.dart';
import 'package:take_my_child/models/parents.model.dart';
import 'package:take_my_child/models/user.model.dart';

class MotoristaRepository {
  DriverModel _motorista = DriverModel();
  ParentsModel _responsavel = ParentsModel();

  Future<dynamic> verificarLogin(String login) async {
    /*var url = Uri.parse(
        "https://3000-harlequin-wildcat-7ivobsaz.ws-us04.gitpod.io/verificarlogin/$login");*/
    var url = Uri.parse(
        "https://take-my-child-api.herokuapp.com/verificarlogin/$login");
    var resposta = await http.get(url);
    print(resposta.body);
    return resposta.body;
  }

  Future<dynamic> cadastrarMotorista(DriverModel motorista) async {
    /*var url = Uri.parse(
        "https://3000-harlequin-wildcat-7ivobsaz.ws-us04.gitpod.io/cadastrarmotorista");*/
    String url = 'https://take-my-child-api.herokuapp.com/cadastrarmotorista';
    print(jsonEncode(motorista.toJson()));

    var response = await http.post(
      url,
      body: jsonEncode(motorista.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  Future<DriverModel> lerMotorista(String login) async {
    /*var url = Uri.parse(
        "https://3000-indigo-lynx-4p0wwhth.ws-us04.gitpod.io/readmotorista/$login");*/
    String url = "https://take-my-child-api.herokuapp.com/readmotorista/$login";
    var response = await http.get(url);
    print(response.body);

    var moto = jsonDecode(response.body);
    _motorista = DriverModel.fromJson(moto[0]);
    print(_motorista.user.cpf);
    //moto.map((objeto) => this._motorista = DriverModel.fromJson(objeto));
    return _motorista;
  }

  Future<DriverModel> lerMotoristaUUID(String uuid) async {
    /*var url = Uri.parse(
        "https://3000-indigo-lynx-4p0wwhth.ws-us04.gitpod.io/readmotorista/$login");*/
    String url =
        "https://take-my-child-api.herokuapp.com/readmotoristauuid/$uuid";
    var response = await http.get(url);
    print(response.body);

    var moto = jsonDecode(response.body);
    _motorista = DriverModel.fromJson(moto[0]);
    //moto.map((objeto) => this._motorista = DriverModel.fromJson(objeto));
    return _motorista;
  }

  Future<void> alterarMotorista(DriverModel motorista) async {
    /*var url = Uri.parse(
        "https://3000-harlequin-wildcat-7ivobsaz.ws-us04.gitpod.io/cadastrarmotorista");*/
    String uuid = motorista.user.id;
    print(uuid);
    String url =
        "https://take-my-child-api.herokuapp.com/updatemotorista/$uuid";
    print(jsonEncode(motorista.toJson()));

    var response = await http.put(
      url,
      body: jsonEncode(motorista.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  Future<void> deletarMotorista(String uuid) async {
    /*var url = Uri.parse(
        "https://3000-indigo-lynx-4p0wwhth.ws-us04.gitpod.io/readmotorista/$login");*/
    String url =
        "https://take-my-child-api.herokuapp.com/deletemotorista/$uuid";
    var response = await http.delete(url);
  }

  Future<dynamic> vincularMotorista(
      String uuid_aluno, String login_motorista) async {
    /*var url = Uri.parse(
        "https://3000-azure-pig-hpn6uol7.ws-us08.gitpod.io/updatecodmotorista");*/
    String url = 'https://take-my-child-api.herokuapp.com/updatecodmotorista';

    var json_body = '{"uuid_aluno":' +
        '"' +
        '$uuid_aluno' +
        '",' +
        '"login_motorista":' +
        '"' +
        '$login_motorista' +
        '"}';
    print(json_body);

    var response = await http.put(
      url,
      body: json_body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.body);

    return response.body;
  }

  Future<List<ParentsModel>> listagemAluno(String uuid) async {
    /*var url = Uri.parse(
        "https://3000-indigo-lynx-4p0wwhth.ws-us04.gitpod.io/readmotorista/$login");*/
    String url = "https://take-my-child-api.herokuapp.com/listagemalunos/$uuid";

    var resposta = await http.get(url);
    print(resposta.body);

    Iterable alunos = jsonDecode(resposta.body);
    //_responsavel = ParentsModel.fromJson(alunos[0]);
    var lista = alunos.map((objeto) => ParentsModel.fromJson(objeto));

    return lista.toList();
  }
}
