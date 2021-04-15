import 'package:flutter/material.dart';

class cadastro_van extends StatefulWidget {
  @override
  _Cadastro_van createState() => _Cadastro_van();
}

class _Cadastro_van extends State<cadastro_van> {
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
            Text("Van"),
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Placa",
                border: OutlineInputBorder(),
              ),
              // onSaved: (value) => _tarefa.texto = value,
              validator: (value) => value.isEmpty ? "Campo obrigatório" : null,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Modelo",
                border: OutlineInputBorder(),
              ),
              //  onSaved: (value) => _tarefa.qtd = int.parse(value),
              validator: (value) => value.isEmpty ? "Campo obrigatório" : null,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Cor",
                border: OutlineInputBorder(),
              ),
              //  onSaved: (value) => _tarefa.qtd = int.parse(value),
              validator: (value) => value.isEmpty ? "Campo obrigatório" : null,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Marca",
                border: OutlineInputBorder(),
              ),
              //  onSaved: (value) => _tarefa.qtd = int.parse(value),
              validator: (value) => value.isEmpty ? "Campo obrigatório" : null,
            ),
            TextButton(
                onPressed: () => 
                    Navigator.of(context).pushNamed('/paginainicial'),
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
