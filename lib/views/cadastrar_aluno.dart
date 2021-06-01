import 'package:flutter/material.dart';
import 'package:take_my_child/models/parents.model.dart';
import 'package:take_my_child/repositories/responsavel.repository.dart';

class cadastro_aluno extends StatefulWidget {
  @override
  _Cadastro_aluno createState() => _Cadastro_aluno();
}

enum trajeto { idaVolta, ida, volta }

trajeto _percurso = trajeto.idaVolta;

class _Cadastro_aluno extends State<cadastro_aluno> {
  final _formKey = GlobalKey<FormState>();
  ResponsavelRepository repository = ResponsavelRepository();

  Future mensagem(BuildContext context, String texto) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: Text(texto),
          actions: [
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "OK",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  create(BuildContext context, ParentsModel _responsavel) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      var resposta = await repository.cadastrarAlunos(_responsavel);

      if (resposta.toString() != "") {
        var msg = await mensagem(context, "Cadastro efetuado com sucesso");
        print(resposta);
        Navigator.of(context).pushNamed('/acesso');
      } else {
        mensagem(context, "Erro ao executar o cadastro");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ParentsModel _pais = ModalRoute.of(context).settings.arguments;
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
        child: Column(
          children: [
            Column(
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
                                color: Color.fromRGBO(240, 230, 140, 0.7),
                              ),
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
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Aluno",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
            Form(
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
                      maxLength: 50,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        labelText: "Nome do aluno",
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                        counterText: "",
                      ),
                      onSaved: (value) => _pais.name_child = value.toString(),
                      validator: (value) =>
                          value.isEmpty ? "Campo obrigatório" : null,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      maxLength: 20,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        labelText: "Escola",
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                        counterText: "",
                      ),
                      onSaved: (value) => _pais.school = value.toString(),
                      validator: (value) =>
                          value.isEmpty ? "Campo obrigatório" : null,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      maxLength: 50,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        labelText: "Endereço da escola",
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                        counterText: "",
                      ),
                      onSaved: (value) =>
                          _pais.addressSchool = value.toString(),
                      validator: (value) =>
                          value.isEmpty ? "Campo obrigatório" : null,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Trajeto / Percurso",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    //1 (ida), 2 (volta) e 3 (ida/volta)
                    ListTile(
                      autofocus: true,
                      title: const Text('Ida/volta'),
                      leading: Radio(
                        fillColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        value: trajeto.idaVolta,
                        groupValue: _percurso,
                        onChanged: (trajeto value) {
                          setState(() {
                            _percurso = value;
                            _pais.route = 3;
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
                            _pais.route = 1;
                            print(_pais.route.toString());
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
                            _pais.route = 2;
                          });
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      child: TextButton(
                        onPressed: () {
                          create(context, _pais);
                        },
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(
                            fontSize: 15,
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
