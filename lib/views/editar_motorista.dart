import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:flutter/material.dart';
import 'package:take_my_child/main.dart';
import 'package:take_my_child/models/driver.model.dart';
import 'package:take_my_child/repositories/motorista.repository.dart';

class editar_motorista extends StatefulWidget {
  @override
  _Editar_motorista createState() => _Editar_motorista();
}

class _Editar_motorista extends State<editar_motorista> {
  DriverModel _motorista = DriverModel();
  MotoristaRepository repository = MotoristaRepository();
  String loginInicial;

  final _formKey = GlobalKey<FormState>();

  Future mensagem(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: Text("Login informado já existe no sistema"),
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

  next(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      print(_motorista.user.name);

      if (loginInicial != _motorista.user.login) {
        var resposta = await repository.verificarLogin(_motorista.user.login);
        print(resposta);

        if (resposta != "") {
          mensagem(context);
        } else {
          Navigator.of(context).pushNamed('/editarvan', arguments: _motorista);
        }
      } else {
        Navigator.of(context).pushNamed('/editarvan', arguments: _motorista);
      }
    }
  }

  String _validarCPF(String value) {
    if (value.length == 0) {
      return "Campo obrigatório";
    } else {
      if (CPF.isValid(CPF.format(value))) {
        return null;
      } else {
        return "CPF inválido";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _motorista = ModalRoute.of(context).settings.arguments;
    loginInicial = _motorista.user.login.toString();

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
          "Editar Motorista",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
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
                                    color: Colors.yellow),
                                child: TextButton(
                                  onPressed: () {},
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
                                    fontSize: 15, fontWeight: FontWeight.bold),
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
                                  color: Color.fromRGBO(240, 230, 140, 0.7),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    next(context);
                                  },
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
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Motorista",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(
                    height: 15,
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
                            maxLength: 50,
                            initialValue: _motorista.user.name.toString(),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: "Nome Completo",
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                              counterText: "",
                            ),
                            onSaved: (value) =>
                                _motorista.user.name = value.toString(),
                            validator: (value) =>
                                value.isEmpty ? "Campo obrigatório" : null,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            maxLength: 11,
                            initialValue: _motorista.user.cpf.toString(),
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "CPF",
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                              counterText: "",
                            ),
                            onSaved: (value) =>
                                _motorista.user.cpf = value.toString(),
                            validator: _validarCPF,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            maxLength: 9,
                            initialValue: _motorista.user.rg.toString(),
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "RG",
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                              counterText: "",
                            ),
                            onSaved: (value) =>
                                _motorista.user.rg = value.toString(),
                            validator: (value) =>
                                value.isEmpty ? "Campo obrigatório" : null,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            maxLength: 11,
                            initialValue: _motorista.cnh.toString(),
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "CNH",
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                              counterText: "",
                            ),
                            onSaved: (value) =>
                                _motorista.cnh = value.toString(),
                            validator: (value) =>
                                value.isEmpty ? "Campo obrigatório" : null,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            initialValue: _motorista.user.telephone.toString(),
                            cursorColor: Colors.black,
                            maxLength: 11,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Telefone",
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                              counterText: "",
                            ),
                            onSaved: (value) =>
                                _motorista.user.telephone = value.toString(),
                            validator: (value) =>
                                value.isEmpty ? "Campo obrigatório" : null,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            //enabled: false,
                            maxLength: 25,
                            initialValue: _motorista.user.login.toString(),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: "Login",
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                              counterText: "",
                            ),
                            onSaved: (value) =>
                                _motorista.user.login = value.toString(),
                            validator: (value) =>
                                value.isEmpty ? "Campo obrigatório" : null,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            initialValue: _motorista.user.password.toString(),
                            obscureText: true,
                            maxLength: 20,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: "Senha",
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                              counterText: "",
                            ),
                            onSaved: (value) =>
                                _motorista.user.password = value.toString(),
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
                next(context);
              },
              child: Text(
                "Seguinte",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
