import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:take_my_child/models/driver.model.dart';
import 'package:take_my_child/models/user.model.dart';

class MotoristaRepository {
  DriverModel _motorista = DriverModel();

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

  Future<void> deletarMotorista(String uuid) async {
    /*var url = Uri.parse(
        "https://3000-indigo-lynx-4p0wwhth.ws-us04.gitpod.io/readmotorista/$login");*/
    String url =
        "https://take-my-child-api.herokuapp.com/deletemotorista/$uuid";
    var response = await http.delete(url);
  }
}
