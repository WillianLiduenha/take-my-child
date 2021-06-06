import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:take_my_child/models/driver.model.dart';
import 'package:take_my_child/models/parents.model.dart';
import 'package:take_my_child/models/shift.model.dart';
import 'package:take_my_child/repositories/motorista.repository.dart';
import 'package:take_my_child/repositories/shift.repository.dart';
import 'package:take_my_child/views/vincular_motorista.dart';

class pagina_inicial_motorista extends StatefulWidget {
  @override
  _Pagina_inicial_motorista createState() => _Pagina_inicial_motorista();
}

enum turno { ida, volta }

turno _percurso;

class _Pagina_inicial_motorista extends State<pagina_inicial_motorista> {
  final _formKey = GlobalKey<FormState>();
  DriverModel _motorista = DriverModel();
  MotoristaRepository repository = MotoristaRepository();
  List<ParentsModel> _responsavel = List<ParentsModel>();
  List<ShiftModel> _alunosTurno = List<ShiftModel>();
  ShiftRepository shiftRepository = ShiftRepository();

  Future<DriverModel> readMotorista(String login) async {
    _motorista = await repository.lerMotorista(login);
    print(_motorista.user.name);
  }

  Future<void> vincularMotorista() async {
    var resposta = await repository.vincularMotorista(
        "2459bb6e-420d-4824-a006-752043eafbac", "joacale1");
    print(resposta);
  }

  Future<DriverModel> listagemAluno(String login) async {
    _responsavel = await repository.listagemAluno(login);
    print(_motorista.user.name);
  }

  Future<void> iniciarTurno(
      BuildContext context, String login_motorista) async {
    int turno = await mensagemIniciarTurno(context);
    if (turno != null) {
      _alunosTurno = await shiftRepository.iniciarTurno(login_motorista, turno);
      Navigator.of(context)
          .pushNamed('/alunospresentes', arguments: _alunosTurno);
    }
  }

  Future mensagemIniciarTurno(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: Text("Qual turno você deseja iniciar?"),
          actions: [
            FlatButton(
              onPressed: () => Navigator.of(context).pop(1),
              child: Text(
                "TURNO IDA",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(2),
              child: Text(
                "TURNO VOLTA",
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

  Future mensagem(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: Text("Sem alunos vinculados!"),
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
          label: "Editar cadastro motorista",
          backgroundColor: Colors.yellow,
          labelBackgroundColor: Colors.white,
          onTap: () async {
            await readMotorista(login);
            Navigator.of(context)
                .pushNamed('/editarmotorista', arguments: _motorista);
            setState(() {});
          },
        ),
        SpeedDialChild(
          child: Icon(
            Icons.group_rounded,
            color: Colors.black,
          ),
          label: "Meus alunos",
          labelBackgroundColor: Colors.white,
          backgroundColor: Colors.yellow,
          onTap: () async {
            await listagemAluno(login);
            if (_responsavel.length != 0) {
              Navigator.of(context)
                  .pushNamed('/meusalunos', arguments: _responsavel);
            } else {
              mensagem(context);
            }

            setState(() {});
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
            onPressed: () {
              Navigator.of(context).pushNamed('/acesso');
            },
          ),
        ],
        backgroundColor: Colors.yellow,
        title: Text(
          "Página Inicial",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Container(
        width: double.infinity,
        child: Card(
          child: Column(children: [
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
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.yellow),
              width: 300,
              height: 60,
              child: TextButton(
                  onPressed: () {
                    iniciarTurno(context, login);
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
                        "Iniciar turno",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  )),
            ),
          ]),
        ),
      ),
      floatingActionButton: controllerSpeedDial(login),
    );
  }
}
