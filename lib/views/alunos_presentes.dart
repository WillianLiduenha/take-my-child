import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_my_child/models/parents.model.dart';
import 'package:take_my_child/models/shift.model.dart';
import 'package:take_my_child/repositories/shift.repository.dart';

class AlunosPresentes extends StatefulWidget {
  @override
  _AlunosPresentesState createState() => _AlunosPresentesState();
}

class _AlunosPresentesState extends State<AlunosPresentes> {
  List<ShiftModel> _alunosPresentes = List<ShiftModel>();
  ShiftRepository shiftRepository = ShiftRepository();

  @override
  Widget build(BuildContext context) {
    _alunosPresentes = ModalRoute.of(context).settings.arguments;

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

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          TextButton.icon(
            label: Text(
              "Finalizar turno",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            icon: const Icon(Icons.login_outlined, color: Colors.black),
            onPressed: () async {
              var resposta = await shiftRepository
                  .readTurnoFinalizado(_alunosPresentes[0].cod_driver);
              print(resposta);
              if (resposta == null) {
                var resposta1 = await shiftRepository
                    .deleteTurnoMotorista(_alunosPresentes[0].cod_driver);
                await mensagem(context, "Parabéns, o turno foi finalizado!");
                Navigator.of(context).pop();
              } else {
                await mensagem(context,
                    "Todos os alunos devem estar com status faltou ou de entregue!");
              }
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
                  child: ListTile(
                      leading:
                          _aluno.shift_status == 0 || _aluno.shift_status == 3
                              ? IconButton(
                                  icon: Icon(Icons.cancel_outlined,
                                      color: Colors.red))
                              : Container(),
                      trailing:
                          _aluno.shift_status == 0 && _aluno.shift_status != 3
                              ? IconButton(
                                  icon: Icon(
                                  Icons.car_repair,
                                  color: Colors.black,
                                  size: 30,
                                ))
                              : IconButton(
                                  icon: Icon(Icons.pin_drop_outlined,
                                      color: Colors.black)),
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
                              SizedBox(
                                height: 5,
                              ),
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
