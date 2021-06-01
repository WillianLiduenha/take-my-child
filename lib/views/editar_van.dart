import 'package:flutter/material.dart';
import 'package:take_my_child/models/driver.model.dart';
import 'package:take_my_child/repositories/motorista.repository.dart';

class editar_van extends StatefulWidget {
  @override
  _Editar_van createState() => _Editar_van();
}

class _Editar_van extends State<editar_van> {
  MotoristaRepository repository = MotoristaRepository();
  DriverModel _motorista = DriverModel();
  final _formKey = GlobalKey<FormState>();
  bool respostaMSG = false;

  Future mensagemExclusao(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: Text("Deseja exluir seu usuário?"),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text("CANCELAR"),
            ),
            FlatButton(
              onPressed: () async {
                respostaMSG = await true;
                Navigator.of(context).pop(true);
              },
              child: Text("SIM"),
            ),
          ],
        );
      },
    );
  }

  Future<bool> mensagemConfirmacao(BuildContext context, String texto) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: Text(texto),
          actions: [
            FlatButton(
              onPressed: () async {
                Navigator.of(context).pop(true);
              },
              child: Text(
                "OK",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  delete(BuildContext context, DriverModel _motorista) async {
    await repository.deletarMotorista(_motorista.user.id);
  }

  alter(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      print(_motorista.user.name);

      await repository.alterarMotorista(_motorista);

      bool msg =
          await mensagemConfirmacao(context, "Alteração efetuada com sucesso");

      if (msg == true) {
        Navigator.of(context).pushNamed('/paginainicialmotorista',
            arguments: _motorista.user.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _motorista = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      //início da tela
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(
            ArgumentError.value(_motorista),
          ),
        ),
        backgroundColor: Colors.yellow,
        title: Text(
          "Editar Van",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1000),
                                    color: Color.fromRGBO(240, 230, 140, 0.7)),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(ArgumentError.value(_motorista));
                                  },
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "Motorista",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.arrow_right_alt, size: 40),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1000),
                                  color: Colors.yellow,
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "Van",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 15,
                    ),
                  Text(
                    "Van",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            maxLength: 7,
                            initialValue: _motorista.plate_van,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: "Placa",
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                              counterText: "",
                            ),
                            onSaved: (value) =>
                                _motorista.plate_van = value.toString(),
                            validator: (value) =>
                                value.isEmpty ? "Campo obrigatório" : null,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                             maxLength: 20,
                            initialValue: _motorista.model_van,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: "Modelo",
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                              counterText: "",
                            ),
                            onSaved: (value) =>
                                _motorista.model_van = value.toString(),
                            validator: (value) =>
                                value.isEmpty ? "Campo obrigatório" : null,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            maxLength: 20,
                            initialValue: _motorista.color_van,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: "Cor",
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                              counterText: "",
                            ),
                            onSaved: (value) =>
                                _motorista.color_van = value.toString(),
                            validator: (value) =>
                                value.isEmpty ? "Campo obrigatório" : null,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            maxLength: 20,
                            initialValue: _motorista.brand_van,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: "Marca",
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                              counterText: "",
                            ),
                            onSaved: (value) =>
                                _motorista.brand_van = value.toString(),
                            validator: (value) =>
                                value.isEmpty ? "Campo obrigatório" : null,
                          ),
                          SizedBox(height: 25),
                          
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
                            width: double.infinity,
                            height: 40,
                            child: TextButton(
                              onPressed: () {
                                alter(context);
                              },
                              child: Text(
                                "Atualizar",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(Colors.black),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(Colors.yellow),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: double.infinity,
                            height: 40,
                            child: TextButton(
                              onPressed: () async {
                                await mensagemExclusao(context);
                                if (respostaMSG == true) {
                                  await delete(context, _motorista);
                                  bool resposta = await mensagemConfirmacao(
                                      context, "Cadastro excluído com sucesso!!");
                                  if (resposta) {
                                    Navigator.of(context).pushNamed('/acesso');
                                  }
                                }
                              },
                              child: Text(
                                "Deletar",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(Colors.black),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(240, 230, 140, 0.7),
                                ),
                              ),
                            ),
                          ),
        ],
      ),
    );
  }
}
