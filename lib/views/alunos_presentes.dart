import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_my_child/models/parents.model.dart';
import 'package:take_my_child/models/shift.model.dart';

class AlunosPresentes extends StatefulWidget {
  @override
  _AlunosPresentesState createState() => _AlunosPresentesState();
}

class _AlunosPresentesState extends State<AlunosPresentes> {
  List<ShiftModel> _alunosPresentes = List<ShiftModel>();

  @override
  Widget build(BuildContext context) {
    _alunosPresentes = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          TextButton.icon(
            icon: Text(
              "Finalizar turno",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            label: const Icon(Icons.login_outlined, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        backgroundColor: Colors.yellow,
        title: Text(
          "Alunos Presentes",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _alunosPresentes.length,
              itemBuilder: (_, indice) {
                //ParentsModel _responsavel = _responsaveis[indice];
                ShiftModel _aluno = _alunosPresentes[indice];
                return Card(
                  child: CheckboxListTile(
                      tristate: true,
                      value: null,
                      onChanged: (value) {
                        return Container();
                      },
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Nome: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    _aluno.name_aluno,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text(
                                    "Endereço: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    _aluno.adress_aluno,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
