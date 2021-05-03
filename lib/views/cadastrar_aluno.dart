import 'package:flutter/material.dart';

class cadastro_aluno extends StatefulWidget {
  @override
  _Cadastro_aluno createState() => _Cadastro_aluno();
}

enum trajeto { idaVolta, ida, volta }

trajeto _percurso = trajeto.idaVolta;

class _Cadastro_aluno extends State<cadastro_aluno> {
  final _formKey = GlobalKey<FormState>();
  create(BuildContext context) {
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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.yellow,
        title: Text(
          "Cadastro Aluno",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Container(
        width: double.infinity,
        child: Card(
          child: Column(
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
                                      color:
                                          Color.fromRGBO(240, 230, 140, 0.7)),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
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
                                  "Responsável",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
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
                                    color: Colors.yellow,
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
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
                                  "Aluno",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "Aluno",
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
                            labelText: "Nome",
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
                            labelText: "Escola",
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
                            labelText: "Endereço da escola",
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
                        Text("Trajeto / Percurso", style: TextStyle(
                          fontSize: 20,

                        ),),
                        ListTile(
                          title: const Text('Ida/volta'),
                          leading: Radio(
                            fillColor:
                                MaterialStateProperty.all<Color>(Colors.black),
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
                            fillColor:
                                MaterialStateProperty.all<Color>(Colors.black),
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
                            fillColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                            value: trajeto.volta,
                            groupValue: _percurso,
                            onChanged: (trajeto value) {
                              setState(() {
                                _percurso = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 40,
                          child: TextButton(
                            onPressed: () {
                              create(context);
                            },
                            child: Text(
                              "Cadastrar",
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
