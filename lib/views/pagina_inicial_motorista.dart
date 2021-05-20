import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:take_my_child/models/driver.model.dart';
import 'package:take_my_child/repositories/motorista.repository.dart';

class pagina_inicial_motorista extends StatefulWidget {
  @override
  _Pagina_inicial_motorista createState() => _Pagina_inicial_motorista();
}

class _Pagina_inicial_motorista extends State<pagina_inicial_motorista> {
  final _formKey = GlobalKey<FormState>();
  DriverModel _motorista = DriverModel();
  MotoristaRepository repository = MotoristaRepository();

  Future<DriverModel> readMotorista(String login) async {
    _motorista = await repository.lerMotorista(login);
    print(_motorista.user.name);
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
          onTap: () {
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
              Navigator.of(context).pop();
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
                  onPressed: () => Navigator.of(context).pushNamed('/'),
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
