import 'package:flutter/material.dart';
import 'package:take_my_child/main.dart';

class vincular_motorista extends StatefulWidget {
  @override
  _Vincular_motorista createState() => _Vincular_motorista();
}

class _Vincular_motorista extends State<vincular_motorista> {
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
                SizedBox(height: 15),
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
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  child: TextButton(
                    onPressed: () {
                      next(context);
                    },
                    child: Text(
                      "Descvincular",
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
                SizedBox(height: 15),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey),
                  height: 2,
                  width: double.infinity,
                ),  

                Text("Mensagem de retorno, ter ou não motorista"),
              ],
              
            ),
          ),
        ),
      ),
    );
  }
}
