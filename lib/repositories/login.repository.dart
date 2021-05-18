import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  Future<dynamic> login(String login1, String senha) async {
    var url = Uri.parse('https://take-my-child-api.herokuapp.com/login');
    /*var url =
        Uri.parse('https://3000-yellow-crane-sbi502o7.ws-us04.gitpod.io/login');*/
    var body1 = jsonEncode({"login": "$login1", "password": "$senha"});
    print(body1);
    var resposta = await http.post(
      url,
      body: body1,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    //print(resposta.body);
    print(resposta.statusCode);

    return resposta.body;
    /*if (resposta.statusCode == 200) {
      var contatos = jsonDecode(resposta.body);
      print(contatos);
      return contatos;
    } else {
      var contatos = "";
      return contatos;
    }*/
  }
}
