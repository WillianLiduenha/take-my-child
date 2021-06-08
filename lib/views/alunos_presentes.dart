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

    Future<void> updateStatus(ShiftModel aluno) async {
      var resposta = await shiftRepository.updateStatus(aluno);
      print(resposta);
      return resposta;
    }

    // int i = 0;
    // void ordenar() {
    //   List<ShiftModel> lista0 = List<ShiftModel>();
    //   List<ShiftModel> lista1 = List<ShiftModel>();
    //   List<ShiftModel> lista2 = List<ShiftModel>();
    //   List<ShiftModel> lista3 = List<ShiftModel>();

    //   while (i < _alunosPresentes.length) {
    //     print(_alunosPresentes);
    //     print(lista1);
    //     print(lista2);
    //     print(lista3);
    //     if (_alunosPresentes[i].shift_status == 0) {
    //       lista0.add(_alunosPresentes[i]);
    //       print(lista0[i].name_aluno);
    //     }
    //     if (_alunosPresentes[i].shift_status == 1) {
    //       lista1.add(_alunosPresentes[i]);
    //     }
    //     if (_alunosPresentes[i].shift_status == 2) {
    //       lista2.add(_alunosPresentes[i]);
    //     }
    //     if (_alunosPresentes[i].shift_status == 3) {
    //       lista3.add(_alunosPresentes[i]);
    //     }
    //     i++;
    //   }
    //   _alunosPresentes1 = lista0 + lista1 + lista2 + lista3;
    // }

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
                ShiftModel _aluno = _alunosPresentes[indice];

                return Card(
                  child: ListTile(
                      leading:
                          _aluno.shift_status == 0 
                              ? IconButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        _aluno.shift_status = 3;
                                        updateStatus(_aluno);
                                        // ordenar();
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.cancel_outlined,
                                      color: Colors.red))
                              : SizedBox(height: 5, width: 5,),
                      trailing: _aluno.shift_status == 0 &&
                              _aluno.shift_status != 3
                          ? IconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    _aluno.shift_status = 1;
                                    updateStatus(_aluno);
                                    // ordenar();
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.car_repair,
                                color: Colors.black,
                                size: 30,
                              ),
                            )
                          : _aluno.shift_status != 2 && _aluno.shift_status != 3
                              ? IconButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        _aluno.shift_status = 2;
                                        updateStatus(_aluno);
                                        // ordenar();
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.pin_drop_outlined,
                                      color: Colors.black),
                                )
                              : _aluno.shift_status == 3 ? Text(
                                  "Faltou",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ) : Text(
                                  "Entregue",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ) ,
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
