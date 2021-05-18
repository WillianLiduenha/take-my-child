import 'package:http/http.dart' as http;
import 'package:take_my_child/models/driver.model.dart';

class MotoristaRepository {
  Future<dynamic> verificarLogin(String login) async {
    /*var url = Uri.parse(
        "https://3000-harlequin-wildcat-7ivobsaz.ws-us04.gitpod.io/verificarlogin/$login");*/
    var url = Uri.parse(
        "https://take-my-child-api.herokuapp.com/verificarlogin/$login");
    var resposta = await http.get(url);
    print(resposta.body);
    return resposta.body;
  }

  /*Future<bool> create(DriverModel motorista) async {
    String url = 'https://3000-harlequin-wildcat-7ivobsaz.ws-us04.gitpod.io/cadastrarmotorista';
    var response = await http.post( 
      url,
      body: jsonEncode(contato.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      Contato contato = Contato.fromJson(jsonDecode(response.body));
      contatos.add(contato);
      notifyListeners();
      return true;
    }
    return false;
  }*/

}
