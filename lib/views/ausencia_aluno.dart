import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:take_my_child/models/absent.model.dart';
import 'package:take_my_child/models/parents.model.dart';
import 'package:take_my_child/views/cadastrar_aluno.dart';

class AusenciaAluno extends StatefulWidget {
  @override
  _AusenciaAlunoState createState() => _AusenciaAlunoState();
}

enum trajeto { idaVolta, ida, volta }

trajeto _percurso = trajeto.idaVolta;

class _AusenciaAlunoState extends State<AusenciaAluno> {
  var maskFormatter = new MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

  final _formKey = GlobalKey<FormState>();
  ParentsModel _responsaveis = new ParentsModel();
  AbsentModel ausente = AbsentModel();
  String date = '';
  bool msg = false;
  DateTime data;

  Future mensagemVerificacao(BuildContext context) async {
    if (ausente.turno_ida == 1 && ausente.turno_volta == 1)
      String turno = "Ida/Volta";
    else {
      if (ausente.turno_ida == 1 && ausente.turno_volta == 0)
        String turno = "Ida";
      else
        String turno = "Volta";
    }
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: Container(
            child: Row(
              children: [
                Icon(Icons.warning_outlined, color: Colors.red),
                SizedBox(
                  width: 15,
                ),
                Text("Confirmar falta:"),
              ],
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "SALVAR",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "CANCELAR",
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

  /*validar(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      final data = date.split("/");
      if (data.length == 3) {
        final day = int.tryParse(data[0]);
        final month = int.tryParse(data[1]);
        final year = int.tryParse(data[2]);
        if (day >= 1 &&
            day <= 31 &&
            month >= 1 &&
            month <= 12 &&
            year >= 2021) {
          ausente.date = DateTime(year, month, day);
          print(ausente.date);
          mensagemVerificacao(context);
          setState(() {
            msg = false;
          });
        } else {
          setState(() {
            msg = true;
          });
        }
      } else {
        setState(() {
          msg = true;
        });
      }
    }
  }*/

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
                  ? Container(
                      height: 30,
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              getDate();
                            },
                            child: Text(
                              "Selecionar Data",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
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
                    )
                  : Text("Olá"),
              /*TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: "Data",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
                onSaved: (value) => date = value,
                validator: (value) =>
                    value.isEmpty ? "Campo obrigatório" : null,
                inputFormatters: [maskFormatter],
              ),*/
              msg == true
                  ? Text(
                      "Data incorreta!",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                      ),
                    )
                  : Container(),
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
                  onPressed: () {
                    //validar(context);
                    //getDate();
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
