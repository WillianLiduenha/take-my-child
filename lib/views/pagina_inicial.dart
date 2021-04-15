import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class pagina_inicial extends StatefulWidget {
  @override
  _Pagina_inicial createState() => _Pagina_inicial();
}

class _Pagina_inicial extends State<pagina_inicial> {
  final _formKey = GlobalKey<FormState>();
  SpeedDial controllerSpeedDial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      children: [
        SpeedDialChild(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          label: "Cadastrar aluno",
          backgroundColor: Colors.yellow,
          labelBackgroundColor: Colors.white,
          onTap: () {
            Navigator.of(context).pushNamed('/cadastroaluno');
            setState(() {});
          },
        ),
        SpeedDialChild(
          child: Icon(
            Icons.edit,
            color: Colors.white,
          ),
          label: "Editar cadastro do aluno",
          labelBackgroundColor: Colors.white,
          backgroundColor: Colors.yellow,
          onTap: () {
            setState(() {});
          },
        ),
        SpeedDialChild(
          child: Icon(
            Icons.edit_outlined,
            color: Colors.white,
          ),
          label: "Editar cadastro motorista",
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
    return Scaffold(
        //início da tela
        appBar: AppBar(
          title: Text("Página Inicial"),
          centerTitle: false,
        ),
        body: Container(
          width: double.infinity,
          child: Card(
            child: Column(children: [
              Text("Seja bem-vindo(a) ao Take My Child"),
              TextButton(
                  onPressed: () => Navigator.of(context).pushNamed('/'),
                  child: Text("Iniciar turno"),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  )),
            ]),
          ),
        ),
        floatingActionButton: controllerSpeedDial());
  }
}
