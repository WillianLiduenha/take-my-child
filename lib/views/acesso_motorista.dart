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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.yellow,
        title: Text(
          "Acesso Motorista",
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
              child: Container(
                height: 200,
                child: Image.asset(
                  "assets/images/van.png",
                ),
              ),
            ),
            Text(
              "Take my child!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Flexible(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: "Usuário",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        fillColor: Color.fromRGBO(240, 230, 140, 0.7),
                        filled: true,
                      ),
                      // onSaved: (value) => _tarefa.texto = value,
                      validator: (value) =>
                          value.isEmpty ? "Campo obrigatório" : null,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        border: OutlineInputBorder(),
                      ),
                      //  onSaved: (value) => _tarefa.qtd = int.parse(value),
                      validator: (value) =>
                          value.isEmpty ? "Campo obrigatório" : null,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/paginainicial'),
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.yellow),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/cadastromotorista'),
                      child: Text("Não tem uma conta? Cadastre-se"),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
