import 'package:flutter/material.dart';
import 'package:take_my_child/models/parents.model.dart';
import 'package:take_my_child/repositories/responsavel.repository.dart';

class editar_aluno extends StatefulWidget {
  @override
  _Editar_Aluno createState() => _Editar_Aluno();
}

enum trajeto { idaVolta, ida, volta }

trajeto _percurso = trajeto.idaVolta;

class _Editar_Aluno extends State<editar_aluno> {
  ParentsModel _responsaveis = new ParentsModel();
  ResponsavelRepository repository = new ResponsavelRepository();

  final _formKey = GlobalKey<FormState>();
  create(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Navigator.of(context).pushNamed('/paginainicial');
    }
  }

  bool respostaMSG = false;
  Future mensagemExclusao(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: Text("Deseja exluir seu usuário?"),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text("CANCELAR"),
            ),
            FlatButton(
              onPressed: () async {
                respostaMSG = await true;
                Navigator.of(context).pop(true);
              },
              child: Text("SIM"),
            ),
          ],
        );
      },
    );
  }

  Future<bool> mensagemConfirmacao(BuildContext context, String texto) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: Text(texto),
          actions: [
            FlatButton(
              onPressed: () async {
                Navigator.of(context).pop(true);
              },
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

  delete(BuildContext context, ParentsModel _responsavel) async {
    await repository.deletarAluno(_responsavel.user.id);
  }

  alter(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      print(_responsaveis.user.name);

      await repository.alterarMotorista(_responsaveis);

      bool msg =
          await mensagemConfirmacao(context, "Alteração efetuada com sucesso");

      if (msg == true) {
        Navigator.of(context).pushNamed('/paginainicialpais',
            arguments: _responsaveis.user.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _responsaveis = ModalRoute.of(context).settings.arguments;
    print(_responsaveis.route.toString());
    _percurso = _responsaveis.route != 3 && _responsaveis.route == 2
        ? trajeto.volta
        : _responsaveis.route == 3 ? trajeto.idaVolta : trajeto.ida;
  

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
          "Editar Aluno",
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
                        initialValue: _responsaveis.name_child.toString(),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          labelText: "Nome do aluno",
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          counterText: "",
                        ),
                        onSaved: (value) =>
                            _responsaveis.name_child = value.toString(),
                        validator: (value) =>
                            value.isEmpty ? "Campo obrigatório" : null,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        maxLength: 20,
                        initialValue: _responsaveis.school.toString(),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          labelText: "Escola",
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          counterText: "",
                        ),
                        onSaved: (value) => _responsaveis.school = value,
                        validator: (value) =>
                            value.isEmpty ? "Campo obrigatório" : null,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        maxLength: 50,
                        initialValue: _responsaveis.addressSchool.toString(),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          labelText: "Endereço da escola",
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          counterText: "",
                        ),
                        onSaved: (value) =>
                            _responsaveis.addressSchool = value,
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
                              _responsaveis.route = 3;
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
                              _responsaveis.route = 1;
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
                              _responsaveis.route = 2;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 40,
                        child: TextButton(
                          onPressed: () {
                            alter(context);
                          },
                          child: Text(
                            "Atualizar",
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
                      SizedBox(height: 5),
                      Container(
                        width: double.infinity,
                        height: 40,
                        child: TextButton(
                          onPressed: () async {
                            await mensagemExclusao(context);
                            if (respostaMSG == true) {
                              await delete(context, _responsaveis);
                              bool resposta = await mensagemConfirmacao(
                                  context, "Cadastro excluído com sucesso!!");
                              if (resposta) {
                                Navigator.of(context).pushNamed('/acesso');
                              }
                            }
                          },
                          child: Text(
                            "Deletar",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.black),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(240, 230, 140, 0.7),
                            ),
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
      ),
    );
  }
}
