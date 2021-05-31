import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:http/http.dart';
import 'package:take_my_child/models/driver.model.dart';
import 'package:take_my_child/models/parents.model.dart';
import 'package:take_my_child/repositories/motorista.repository.dart';
import 'package:take_my_child/repositories/responsavel.repository.dart';
import 'package:take_my_child/views/ausencia_aluno.dart';

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

  ParentsModel _responsaveis = new ParentsModel();
  DriverModel _motorista = new DriverModel();
  ResponsavelRepository repository = ResponsavelRepository();
  MotoristaRepository motoristaRepository = MotoristaRepository();

  Future<ParentsModel> readAluno(String login) async {
    _responsaveis = await repository.lerAluno(login);

    print(_responsaveis);
  }

  Future<DriverModel> readMotorista(String uuid) async {
    _motorista = await motoristaRepository.lerMotoristaUUID(uuid);
    print(_motorista.user.name);
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
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.blue),
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ]),
        ),
      ),
      floatingActionButton: controllerSpeedDial(login),
    );
  }
}
