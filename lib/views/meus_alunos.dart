import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_my_child/models/parents.model.dart';

class MeusAlunos extends StatefulWidget {
  @override
  _MeusAlunosState createState() => _MeusAlunosState();
}

class _MeusAlunosState extends State<MeusAlunos> {
  List<ParentsModel> _responsaveis;

  @override
  Widget build(BuildContext context) {
    _responsaveis = ModalRoute.of(context).settings.arguments;

    print(_responsaveis[0].name_child);

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
          "Meus alunos",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
          children: [
            Flexible(
      flex: 9,
      child: ListView.builder(
        itemCount: _responsaveis.length,
        itemBuilder: (_, indice) {
          ParentsModel _responsavel = _responsaveis[indice];
          return Column(
            children: [
              Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),

                child: Card(

                  color: Color.fromARGB(255, 252, 222, 118),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListTile(

                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Nome do Aluno: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                _responsavel.name_child,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
textScaleFactor: 0.9,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Nome Responsável: "),
                                  Text(_responsavel.user.name, textScaleFactor: 0.9,),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text("Telefone contato: "),
                                  Text(_responsavel.user.telephone),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text("Endereço: "),
                                  Text(_responsavel.address),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text("Escola: "),
                                  Text(_responsavel.school),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: 2,
                width: double.infinity,
                color: Colors.black,
              ),
              SizedBox(height: 5),
            ],
          );
        },
      ), // criar a lista com os dados do read();
            ),
          ],
        ),
    );
  }
}
