import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class pagina_inicial_pais extends StatefulWidget {
  @override
  _Pagina_inicial_pais createState() => _Pagina_inicial_pais ();
}

class _Pagina_inicial_pais extends State<pagina_inicial_pais> {
  final _formKey = GlobalKey<FormState>();
  SpeedDial controllerSpeedDial() {
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
          onTap: () {
            Navigator.of(context).pushNamed('/editarpais');
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
    return Scaffold(
      //início da tela
      appBar: AppBar(
        leading: Container(),
        actions: [ IconButton(
            icon: const Icon(Icons.login_outlined),
            color: Colors.black,
            onPressed: () {
            },
          ),],
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
            SizedBox(height: 50,),
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
      floatingActionButton: controllerSpeedDial(),
    );
  }
}
