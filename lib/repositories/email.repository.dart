import 'dart:convert';

import 'package:http/http.dart' as http;

class EmailRepository {
  Future<void> sendEmailDestiny(String email) async {
    // var url =
    // Uri.parse("https://3000-blue-barnacle-4wbn17hq.ws-us08.gitpod.io/email");
    String url = "https://take-my-child-api.herokuapp.com/email";

    var json_body = '{"destinatario":' +
        '"' +
        '$email' +
        '",' +
        '"assunto": "Take my child informa: Chegou ao destino!",' +
        '"texto": "<h3>O motorista informa que seu filho foi entregue ao destino!</h3>"}';
    print(json_body);

    var resposta = await http.post(
      url,
      body: json_body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  Future<void> sendEmailVan(String email) async {
    // var url =
    // Uri.parse("https://3000-blue-barnacle-4wbn17hq.ws-us08.gitpod.io/email");
    String url = "https://take-my-child-api.herokuapp.com/email";

    var json_body = '{"destinatario":' +
        '"' +
        '$email' +
        '",' +
        '"assunto": "Take my child informa: Na Van!",' +
        '"texto": "<h3>O motorista informa que seu filho escontra-se dentro da van!</h3>"}';
    print(json_body);

    var resposta = await http.post(
      url,
      body: json_body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  Future<void> sendEmailAbsent(String email) async {
    // var url =
    // Uri.parse("https://3000-blue-barnacle-4wbn17hq.ws-us08.gitpod.io/email");
    String url = "https://take-my-child-api.herokuapp.com/email";

    var json_body = '{"destinatario":' +
        '"' +
        '$email' +
        '",' +
        '"assunto": "Take my child informa: Aluno faltou!",' +
        '"texto": "<h3>O motorista informa que seu filho faltou!</h3><br /><p>Recomendamos que informe ao motorista que o aluno irá faltar por meio do nosso aplicativo.</p>"}';
    print(json_body);

    var resposta = await http.post(
      url,
      body: json_body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }
}
