import 'package:flutter/material.dart';

class cadastro_motorista extends StatefulWidget {
  @override
  _Cadastro_motorista createState() => _Cadastro_motorista();
}

class _Cadastro_motorista extends State<cadastro_motorista> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //início da tela
      appBar: AppBar(
        title: Text("Cadastro"),
        centerTitle: false,
      ),
      body: Container(
        width: double.infinity,
        child: Card(
          child: Column(children: [
            Row(
              children: [
                Text("Motorista"),
                SizedBox(
                  width: 30,
                ),
                Text("Van"),
              ],
            ),
            Text("Motorista"),
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Nome completo",
                border: OutlineInputBorder(),
              ),
              // onSaved: (value) => _tarefa.texto = value,
              validator: (value) => value.isEmpty ? "Campo obrigatório" : null,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "CPF",
                border: OutlineInputBorder(),
              ),
              //  onSaved: (value) => _tarefa.qtd = int.parse(value),
              validator: (value) => value.isEmpty ? "Campo obrigatório" : null,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "RG",
                border: OutlineInputBorder(),
              ),
              //  onSaved: (value) => _tarefa.qtd = int.parse(value),
              validator: (value) => value.isEmpty ? "Campo obrigatório" : null,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "CNH",
                border: OutlineInputBorder(),
              ),
              //  onSaved: (value) => _tarefa.qtd = int.parse(value),
              validator: (value) => value.isEmpty ? "Campo obrigatório" : null,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Login",
                border: OutlineInputBorder(),
              ),
              //  onSaved: (value) => _tarefa.qtd = int.parse(value),
              validator: (value) => value.isEmpty ? "Campo obrigatório" : null,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Senha",
                border: OutlineInputBorder(),
              ),
              //  onSaved: (value) => _tarefa.qtd = int.parse(value),
              validator: (value) => value.isEmpty ? "Campo obrigatório" : null,
            ),
            TextButton(
                onPressed: () => 
                    Navigator.of(context).pushNamed('/cadastrovan'),
                child: Text("Seguinte"),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.yellow),
                )),
          ]),
        ),
      ),
    );
  }
}
