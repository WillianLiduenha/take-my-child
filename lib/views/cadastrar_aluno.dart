import 'package:flutter/material.dart';

class cadastro_aluno extends StatefulWidget {
  @override
  _Cadastro_aluno createState() => _Cadastro_aluno();
}

enum trajeto { idaVolta, ida, volta }

trajeto _percurso = trajeto.idaVolta;

class _Cadastro_aluno extends State<cadastro_aluno> {
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
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Nome do Aluno",
                border: OutlineInputBorder(),
              ),
              // onSaved: (value) => _tarefa.texto = value,
              validator: (value) => value.isEmpty ? "Campo obrigatório" : null,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Nome do Responsável",
                border: OutlineInputBorder(),
              ),
              //  onSaved: (value) => _tarefa.qtd = int.parse(value),
              validator: (value) => value.isEmpty ? "Campo obrigatório" : null,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Telefone Responsável",
                border: OutlineInputBorder(),
              ),
              //  onSaved: (value) => _tarefa.qtd = int.parse(value),
              validator: (value) => value.isEmpty ? "Campo obrigatório" : null,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Endereço",
                border: OutlineInputBorder(),
              ),
              //  onSaved: (value) => _tarefa.qtd = int.parse(value),
              validator: (value) => value.isEmpty ? "Campo obrigatório" : null,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Instituição escolar",
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
            Text("Trajeto / Percurso"),
            ListTile(
              title: const Text('Ida/volta'),
              leading: Radio(
                value: trajeto.idaVolta,
                groupValue: _percurso,
                onChanged: (trajeto value) {
                  setState(() {
                    _percurso = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Ida'),
              leading: Radio(
                value: trajeto.ida,
                groupValue: _percurso,
                onChanged: (trajeto value) {
                  setState(() {
                    _percurso = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Volta'),
              leading: Radio(
                value: trajeto.volta,
                groupValue: _percurso,
                onChanged: (trajeto value) {
                  setState(() {
                    _percurso = value;
                  });
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
