import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_my_child/models/parents.model.dart';
import 'package:take_my_child/models/shift.model.dart';
import 'package:take_my_child/repositories/email.repository.dart';
import 'package:take_my_child/repositories/shift.repository.dart';

class AlunosPresentes extends StatefulWidget {
  final List<ShiftModel> _alunosPresentes;

  AlunosPresentes(this._alunosPresentes);

  @override
  _AlunosPresentesState createState() => _AlunosPresentesState();
}

class _AlunosPresentesState extends State<AlunosPresentes> {
  ShiftRepository shiftRepository = ShiftRepository();
  EmailRepository emailRepository = EmailRepository();

  @override
  Widget build(BuildContext context) {
    Future<void> updateStatus(ShiftModel aluno) async {
      var resposta = await shiftRepository.updateStatus(aluno);
      print(resposta);
      if (resposta != null && resposta != "") {
        if (aluno.shift_status == 1)
          await emailRepository.sendEmailVan(resposta);
        else {
          if (aluno.shift_status == 2)
            await emailRepository.sendEmailDestiny(resposta);
          else
            await emailRepository.sendEmailAbsent(resposta);
        }
      }

      setState(() {
        widget._alunosPresentes.sort((a, b) => a.shift_status.compareTo(b.shift_status));
      });
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
                  .readTurnoFinalizado(widget._alunosPresentes[0].cod_driver);
              print(resposta);
              if (resposta == null) {
                var resposta1 = await shiftRepository.deleteTurnoMotorista(
                    widget._alunosPresentes[0].cod_driver);
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
              itemCount: widget._alunosPresentes.length,
              itemBuilder: (_, indice) {
                ShiftModel _aluno = widget._alunosPresentes[indice];

                return Card(
                  child: ListTile(
                      leading: _aluno.shift_status == 0
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
                          : SizedBox(
                              height: 5,
                              width: 5,
                            ),
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
                              : _aluno.shift_status == 3
                                  ? Text(
                                      "Faltou",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    )
                                  : Text(
                                      "Entregue",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
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
