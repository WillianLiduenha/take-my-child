import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:take_my_child/models/parents.model.dart';
import 'package:take_my_child/repositories/responsavel.repository.dart';

class pagina_inicial_pais extends StatefulWidget {
  @override
  _Pagina_inicial_pais createState() => _Pagina_inicial_pais();
}

class _Pagina_inicial_pais extends State<pagina_inicial_pais> {
  final _formKey = GlobalKey<FormState>();


 ParentsModel _responsaveis = new ParentsModel();
  ResponsavelRepository repository = ResponsavelRepository();

  Future<ParentsModel> readAluno(String login) async {
    _responsaveis = await repository.lerAluno(login);
    
    print(_responsaveis);
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
          onTap: () async{
            await readAluno(login);
            Navigator.of(context).pushNamed('/editarpais', arguments: _responsaveis);
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
          onTap: () {
            setState(() {});
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
