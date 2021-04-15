import 'package:flutter/material.dart';

class acesso_motorista extends StatefulWidget {
  @override
  _Acesso_motorista createState() => _Acesso_motorista();
}

class _Acesso_motorista extends State<acesso_motorista> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //início da tela
      appBar: AppBar(
        title: Text("Acesso Motorista"),
        centerTitle: false,
      ),
      body: 
      Container(
        width: double.infinity,
        child: Card(
          child: Column(children: [
            Image.asset(
              "assets/images/takemychild.png",
            ),
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Usuário",
                border: OutlineInputBorder(),
              ),
              // onSaved: (value) => _tarefa.texto = value,
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
                    Navigator.of(context).pushNamed('/paginainicial'),
                child: Text("Entrar"),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.yellow),
                )),
            TextButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed('/cadastromotorista'),
                child: Text("Não tem uma conta? Cadastre-se"),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                )),
                
          ]),
        ),
      ),
    );
  }
}
