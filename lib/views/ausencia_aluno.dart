import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:take_my_child/models/absent.model.dart';
import 'package:take_my_child/models/parents.model.dart';
import 'package:take_my_child/repositories/absent.repository.dart';
import 'package:take_my_child/views/cadastrar_aluno.dart';

class AusenciaAluno extends StatefulWidget {
  @override
  _AusenciaAlunoState createState() => _AusenciaAlunoState();
}

enum trajeto { idaVolta, ida, volta }

trajeto _percurso;

class _AusenciaAlunoState extends State<AusenciaAluno> {
  /*var maskFormatter = new MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});*/

  final _formKey = GlobalKey<FormState>();
  ParentsModel _responsaveis = ParentsModel();
  AbsentRepository repository = AbsentRepository();

  AbsentModel ausente = AbsentModel();
  DateTime data;

  Future<void> cadastrarAusente(BuildContext context) async {
    var resposta = await repository.cadastrarAusente(ausente);

    if (resposta != null) {
      await mensagem(context, "Ausência cadastrada com sucesso!");
      Navigator.of(context).pushNamed('/paginainicialpais', arguments: _responsaveis.user.login);
    } else
      mensagem(context, "Ausência NÃO CADASTRADA!");
  }

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

  Future mensagemVerificacao(BuildContext context) async {
    String turno;
    if (ausente.turno_ida == 1 && ausente.turno_volta == 1)
      turno = "Ida/Volta";
    else {
      if (ausente.turno_ida == 1 && ausente.turno_volta == 0)
        turno = "Ida";
      else
        turno = "Volta";
    }
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: Container(
            height: 35,
            child: Row(
              children: [
                Icon(
                  Icons.warning_outlined,
                  color: Colors.red,
                  size: 30,
                ),
                SizedBox(
                  width: 15,
                ),
                Text("Confirmar falta?"),
              ],
            ),
          ),
          content: Container(
            height: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Data: " +
                      ausente.date.day.toString() +
                      "/" +
                      ausente.date.month.toString() +
                      "/" +
                      ausente.date.year.toString(),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Trajeto escolhido: " + turno.toString())
              ],
            ),
          ),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  "CANCELAR",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            FlatButton(
              onPressed: () async {
                Navigator.of(context).pop(true);
              },
              child: Text("SIM",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        );
      },
    );
  }

  getDate() async {
    DateTime data = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 90)),
    );
    print(data);

    setState(() {
      ausente.date = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    _responsaveis = ModalRoute.of(context).settings.arguments;
    int listTrajeto = _responsaveis.route;
    ausente.cod_parents = _responsaveis.user.id;
    return Scaffold(
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
          "Meu filho irá faltar",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ausente.date == null
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.yellow),
                        width: 250,
                        height: 40,
                        child: TextButton(
                          onPressed: () {
                            getDate();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Selecionar data",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(Icons.calendar_today, color: Colors.black),
                            ],
                          ),
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      child: Row(
                        children: [
                          Text(
                            "Data: ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            ausente.date.day.toString() +
                                "/" +
                                ausente.date.month.toString() +
                                "/" +
                                ausente.date.year.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.calendar_today,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            onPressed: () {
                              getDate();
                            },
                          )
                        ],
                      ),
                    ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Trajeto / Percurso",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              listviewIdaVolta(listTrajeto),
              SizedBox(
                height: 35,
              ),
              Container(
                width: double.infinity,
                height: 45,
                child: TextButton(
                  onPressed: () async {
                    if (ausente.date != null) {
                      if (ausente.turno_ida != null &&
                          ausente.turno_volta != null) {
                        bool respostaMSG = await mensagemVerificacao(context);
                        print(respostaMSG);
                        if (respostaMSG) {
                          await cadastrarAusente(context);
                        }
                      } else {
                        await mensagem(
                            context, "Você deve selecionar o tipo de trajeto");
                      }
                    } else {
                      await mensagem(context, "Você deve selecionar uma data");
                    }
                  },
                  child: Text(
                    "Salvar",
                    style: TextStyle(
                      fontSize: 22,
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
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon( Icons.warning_outlined, color: Colors.red,),
                  SizedBox(width: 5,),
                  Text("ATENÇÃO, APÓS SALVAR NÃO SERÁ POSSÍVEL DESFAZER A AÇÃO!",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listviewIdaVolta(int listTrajeto) {
    if (listTrajeto == 3) {
      return Column(
        children: [
          ListTile(
            title: const Text(
              'Ida/volta',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            leading: Radio(
              fillColor: MaterialStateProperty.all<Color>(Colors.black),
              value: trajeto.idaVolta,
              groupValue: _percurso,
              onChanged: (trajeto value) {
                setState(() {
                  _percurso = value;
                  ausente.turno_ida = 1;
                  ausente.turno_volta = 1;
                });
              },
            ),
          ),
          ListTile(
            title: const Text(
              'Ida',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            leading: Radio(
              fillColor: MaterialStateProperty.all<Color>(Colors.black),
              value: trajeto.ida,
              groupValue: _percurso,
              onChanged: (trajeto value) {
                setState(() {
                  _percurso = value;
                  ausente.turno_ida = 1;
                  ausente.turno_volta = 0;
                });
              },
            ),
          ),
          ListTile(
            title: const Text(
              'Volta',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            leading: Radio(
              fillColor: MaterialStateProperty.all<Color>(Colors.black),
              value: trajeto.volta,
              groupValue: _percurso,
              onChanged: (trajeto value) {
                setState(() {
                  _percurso = value;
                  ausente.turno_ida = 0;
                  ausente.turno_volta = 1;
                });
              },
            ),
          ),
        ],
      );
    } else {
      if (listTrajeto == 1) {
        return Column(
          children: [
            ListTile(
              title: const Text(
                'Ida',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              leading: Radio(
                fillColor: MaterialStateProperty.all<Color>(Colors.black),
                value: trajeto.ida,
                groupValue: _percurso,
                onChanged: (trajeto value) {
                  setState(() {
                    _percurso = value;
                    ausente.turno_ida = 1;
                    ausente.turno_volta = 0;
                  });
                },
              ),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            ListTile(
              title: const Text(
                'Volta',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              leading: Radio(
                fillColor: MaterialStateProperty.all<Color>(Colors.black),
                value: trajeto.volta,
                groupValue: _percurso,
                onChanged: (trajeto value) {
                  setState(() {
                    _percurso = value;
                    ausente.turno_ida = 0;
                    ausente.turno_volta = 1;
                  });
                },
              ),
            ),
          ],
        );
      }
    }
  }
}
