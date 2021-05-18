import 'dart:html';

import 'package:flutter/material.dart';
import 'package:take_my_child/models/driver.model.dart';
import 'package:take_my_child/repositories/motorista.repository.dart';

class cadastro_van extends StatefulWidget {
  @override
  _Cadastro_van createState() => _Cadastro_van();
}

class _Cadastro_van extends State<cadastro_van> {
  final _formKey = GlobalKey<FormState>();
  MotoristaRepository repository = MotoristaRepository();

  Future mensagem(BuildContext context, String texto) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: Text(texto),
          actions: [
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
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

  create(BuildContext context, DriverModel _motorista) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      var resposta = await repository.cadastrarMotorista(_motorista);

      if (resposta.toString() != "") {
        var msg = await mensagem(context, "Cadastro efetuado com sucesso");
        print(resposta);
        Navigator.of(context).pushNamed('/acesso');
      } else {
        mensagem(context, "Erro ao executar o cadastro");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    DriverModel _motorista = ModalRoute.of(context).settings.arguments;
    //print(_motorista.cnh);
    return Scaffold(
      //início da tela
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.yellow,
        title: Text(
          "Cadastro Van",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    Navigator.of(context).pop();
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
                  Text(
                    "Van",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: Form(
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
                        cursorColor: Colors.black,
                        maxLength: 7,
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
                        cursorColor: Colors.black,
                        maxLength: 20,
                        decoration: InputDecoration(
                          labelText: "Modelo",
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          counterText: "",
                        ),
                        onSaved: (value) => _motorista.model_van = value,
                        validator: (value) =>
                            value.isEmpty ? "Campo obrigatório" : null,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        cursorColor: Colors.black,
                        maxLength: 20,
                        decoration: InputDecoration(
                          labelText: "Cor",
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          counterText: "",
                        ),
                        onSaved: (value) => _motorista.color_van = value,
                        validator: (value) =>
                            value.isEmpty ? "Campo obrigatório" : null,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        cursorColor: Colors.black,
                        maxLength: 20,
                        decoration: InputDecoration(
                          labelText: "Marca",
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          counterText: "",
                        ),
                        onSaved: (value) => _motorista.brand_van = value,
                        validator: (value) =>
                            value.isEmpty ? "Campo obrigatório" : null,
                      ),
                      SizedBox(height: 25),
                      Container(
                        width: double.infinity,
                        height: 40,
                        child: TextButton(
                          onPressed: () {
                            create(context, _motorista);
                          },
                          child: Text(
                            "Cadastrar",
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
