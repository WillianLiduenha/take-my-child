import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:http/http.dart';
import 'package:take_my_child/models/driver.model.dart';
import 'package:take_my_child/models/parents.model.dart';
import 'package:take_my_child/models/shift.model.dart';
import 'package:take_my_child/repositories/motorista.repository.dart';
import 'package:take_my_child/repositories/responsavel.repository.dart';
import 'package:take_my_child/repositories/shift.repository.dart';

class ReturnArguments {
  ParentsModel responsaveis = ParentsModel();
  DriverModel motorista = DriverModel();
}

class pagina_inicial_pais extends StatefulWidget {
  @override
  _Pagina_inicial_pais createState() => _Pagina_inicial_pais();
}

class _Pagina_inicial_pais extends State<pagina_inicial_pais> {
  final _formKey = GlobalKey<FormState>();
  int trajeto = 0;

  ParentsModel _responsaveis = new ParentsModel();
  DriverModel _motorista = new DriverModel();
  ResponsavelRepository repository = ResponsavelRepository();
  MotoristaRepository motoristaRepository = MotoristaRepository();
  ShiftRepository shiftRepository = new ShiftRepository();
  ShiftModel shiftModel = new ShiftModel();

  Future<ParentsModel> readAluno(String login) async {
    _responsaveis = await repository.lerAluno(login);

    print(_responsaveis);
  }

  Future<DriverModel> readMotorista(String uuid) async {
    _motorista = await motoristaRepository.lerMotoristaUUID(uuid);
    print(_motorista.user.name);
  }

  Future readTurno(String login) async {
    shiftModel = await shiftRepository.readTurnoAluno(login);
    print(shiftModel);
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

  Future mensagemConfirmacaoSaida(BuildContext context, String texto) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: Text(texto),
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

  SpeedDial controllerSpeedDial(String login) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: Colors.yellow,
      foregroundColor: Colors.black,
      overlayColor: Colors.black,
      overlayOpacity: 0.4,
      children: [
        SpeedDialChild(
          child: Icon(
            Icons.edit,
            color: Colors.black,
          ),
          label: "Editar cadastro responsável",
          backgroundColor: Colors.yellow,
          labelBackgroundColor: Colors.white,
          onTap: () async {
            await readAluno(login);
            Navigator.of(context)
                .pushNamed('/editarpais', arguments: _responsaveis);
            setState(() {});
          },
        ),
        SpeedDialChild(
          child: Icon(
            Icons.warning_outlined,
            color: Colors.red,
          ),
          label: "Meu filho irá faltar!",
          labelBackgroundColor: Colors.white,
          backgroundColor: Colors.yellow,
          onTap: () async {
            await readAluno(login);
            if (_responsaveis.codDriver != null) {
              Navigator.of(context)
                  .pushNamed('/ausenciaaluno', arguments: _responsaveis);
            } else {
              await mensagem(context, "Motorista ainda não cadastrado!");
            }
          },
        ),
        SpeedDialChild(
          child: Icon(
            Icons.group_add,
            color: Colors.black,
          ),
          label: "Vincular ao motorista",
          labelBackgroundColor: Colors.white,
          backgroundColor: Colors.yellow,
          onTap: () async {
            ReturnArguments argumentos = new ReturnArguments();
            await readAluno(login);
            argumentos.responsaveis = _responsaveis;
            if (_responsaveis.codDriver != null) {
              await readMotorista(_responsaveis.codDriver);
              argumentos.motorista = _motorista;
            }
            Navigator.of(context)
                .pushNamed('/vincularmotorista', arguments: argumentos);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    String login = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      //início da tela
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(
            icon: const Icon(Icons.login_outlined),
            color: Colors.black,
            onPressed: () async {
              var retorno = await mensagemConfirmacaoSaida(
                  context, "Você deseja sair do sistema?");
              if (retorno) {
                Navigator.of(context).pushNamed('/acesso');
              }
            },
          ),
        ],
        backgroundColor: Colors.yellow,
        title: Text(
          "Página Inicial Responsável",
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
              SizedBox(height: 60),
              Image.asset(
                "assets/images/van.png",
                width: 150,
              ),
              Container(
                margin: const EdgeInsets.only(right: 40, left: 40),
                child: Text(
                  "Seja bem-vindo(a) ao Take My Child!",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.yellow),
                  width: 300,
                  height: 60,
                  child: TextButton(
                    onPressed: () async {
                      // iniciarTurno(context, login);
                      // await emailRepository.sendMail();
                      await readTurno(login);

                      if (shiftModel != null) {
                        if (shiftModel.shift_status == 3) {
                          mensagem(context,
                              "O motorista informou que seu filho faltou! Por favor, lembre-se de cadastrar a falta pelo nosso aplicativo!");
                          setState(() {
                            trajeto = 0;
                          });
                        } else {
                          setState(() {
                            trajeto = 1;
                          });
                        }
                      } else {
                        mensagem(
                            context, "O motorista ainda não iniciou o turno");
                        setState(() {
                          trajeto = 0;
                        });
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/van.png",
                          width: 40,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          trajeto == 1 ? "Recarregar" : "Acompanhar trajeto",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              trajeto == 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                              "Início percurso!",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
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
                                  color: shiftModel.shift_status > 0 &&
                                          shiftModel.shift_status != 3
                                      ? Colors.yellow
                                      : Color.fromRGBO(240, 230, 140, 0.7)),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: shiftModel.shift_status > 0 &&
                                            shiftModel.shift_status != 3
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Aluno na van",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
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
                                  color: shiftModel.shift_status == 2
                                      ? Colors.yellow
                                      : Color.fromRGBO(240, 230, 140, 0.7)),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "3",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: shiftModel.shift_status == 2
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Chegou ao destino",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.warning_outlined,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                              "ATENÇÃO: MANTENHA OS DADOS DE SEU E-MAIL SEMPRE ATUALIZADO!\nDÊ PRIORIDADE DE NOTIFICAR A FALTA PELO APLICATIVO",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              )),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: controllerSpeedDial(login),
    );
  }
}
