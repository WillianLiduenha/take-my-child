import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:take_my_child/main.dart';
import 'package:take_my_child/views/pagina_inicial_pais.dart';

class vincular_motorista extends StatefulWidget {
  @override
  _Vincular_motorista createState() => _Vincular_motorista();
}

class _Vincular_motorista extends State<vincular_motorista> {
  bool vinculado;

  final _formKey = GlobalKey<FormState>();
  next(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Navigator.of(context).pushNamed('/cadastrovan');
    }
  }

  @override
  Widget build(BuildContext context) {
    ReturnArguments argumentos = ModalRoute.of(context).settings.arguments;
    argumentos.responsaveis.codDriver == null
        ? vinculado = false
        : vinculado = true;

    print(vinculado);

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
          "Vincular Motorista",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Container(
        width: double.infinity,
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
                  decoration: InputDecoration(
                    labelText: "Login Motorista",
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                  ),
                  //onSaved: (value) => _tarefa.texto = value,
                  validator: (value) =>
                      value.isEmpty ? "Campo obrigatório" : null,
                ),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  height: 40,
                  child: TextButton(
                    onPressed: () {
                      next(context);
                    },
                    child: Text(
                      "Vincular",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
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
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  child: TextButton(
                    onPressed: () {
                      vinculado != false ? next(context) : Container();
                    },
                    child: Text(
                      "Desvincular",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor: vinculado == false
                          ? MaterialStateProperty.all<Color>(
                              Color.fromRGBO(130, 130, 130, 0.8))
                          : MaterialStateProperty.all<Color>(Colors.yellow),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black),
                  height: 2,
                  width: double.infinity,
                ),
                SizedBox(height: 20),
                vinculado == false
                    ? Text(
                        "Não há motorista vinculado!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        width: double.infinity,
                        height: 130,
                        color: Color.fromARGB(255, 252, 222, 118),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dados do motorista Vinculado:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "NOME MOTORISTA",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Login motorista",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ]),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
