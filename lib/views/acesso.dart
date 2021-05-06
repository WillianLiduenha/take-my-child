import 'package:flutter/material.dart';

class acesso extends StatefulWidget {
  @override
  _acesso createState() => _acesso();
}

class _acesso extends State<acesso> {
  final _formKey = GlobalKey<FormState>();
  login(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.of(context).pushNamed('/paginainicial');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //início da tela
      appBar: AppBar(
        elevation: 0,
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
      body: Column(
        children: [
          Container(
            child: Flexible(
              flex: 2,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                //color: Colors.yellow,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                    ),
                    color: Colors.yellow),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      child: Image.asset(
                        "assets/images/van.png",
                      ),
                    ),
                    Text(
                      "Take my child!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Flexible(
              flex: 2,
              child: Form(
                key: _formKey,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                  child: Column(
                    children: [
                      TextFormField(
                        autofocus: true,
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          labelText: "Usuário",
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
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
                        //onSaved: (value) => _tarefa.texto = value,
                        validator: (value) =>
                            value.isEmpty ? "Campo obrigatório" : null,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
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
                        //onSaved: (value) => _tarefa.texto = value,
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
                          onPressed: () => login(context),
                          child: Text(
                            "Entrar",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
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
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Não tem uma conta? Cadastre-se:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 175,
                            child: TextButton(
                              onPressed: () => Navigator.of(context)
                                  .pushNamed('/cadastromotorista'),
                              child: Text(
                                "Motorista",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10))),
                                foregroundColor: MaterialStateProperty.all<Color>(
                                    Colors.black),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.yellow),
                              ),
                            ),
                          ),
                          SizedBox(width: 100,),
                          Container(
                            height: 50,
                            width: 175,
                            child: TextButton(
                              onPressed: () => Navigator.of(context)
                                  .pushNamed('/cadastropais'),
                              child: Text(
                                "Responsável",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10))),
                                foregroundColor: MaterialStateProperty.all<Color>(
                                    Colors.black),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.yellow),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}