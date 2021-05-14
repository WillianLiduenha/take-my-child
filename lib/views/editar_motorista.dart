import 'package:flutter/material.dart';
import 'package:take_my_child/main.dart';

class Editar_motorista extends StatefulWidget {
  @override
  _Editar_motorista createState() => _Editar_motorista();
}

class _Editar_motorista extends State<Editar_motorista> {
  final _formKey = GlobalKey<FormState>();
  next(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Navigator.of(context).pushNamed('/cadastrovan');
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        width: double.infinity,
        child: Card(
          child: ListView(
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
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
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
                      height: 15,
                    ),
                    Text(
                      "Motorista",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
                          decoration: InputDecoration(
                            labelText: "Nome Completo",
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(),
                          ),
                          //onSaved: (value) => _tarefa.texto = value,
                          validator: (value) =>
                              value.isEmpty ? "Campo obrigatório" : null,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "CPF",
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(),
                          ),
                          //onSaved: (value) => _tarefa.texto = value,
                          validator: (value) =>
                              value.isEmpty ? "Campo obrigatório" : null,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "RG",
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(),
                          ),
                          //onSaved: (value) => _tarefa.texto = value,
                          validator: (value) =>
                              value.isEmpty ? "Campo obrigatório" : null,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "CNH",
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(),
                          ),
                          //onSaved: (value) => _tarefa.texto = value,
                          validator: (value) =>
                              value.isEmpty ? "Campo obrigatório" : null,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            labelText: "Login",
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(),
                          ),
                          //onSaved: (value) => _tarefa.texto = value,
                          validator: (value) =>
                              value.isEmpty ? "Campo obrigatório" : null,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          obscureText: true,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            labelText: "Senha",
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(),
                          ),
                          //onSaved: (value) => _tarefa.texto = value,
                          validator: (value) =>
                              value.isEmpty ? "Campo obrigatório" : null,
                        ),
                        SizedBox(height: 25),
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
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.yellow),
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
      ),
    );
  }
}
