import 'package:flutter/material.dart';

class inicio extends StatefulWidget {
  @override
  _Inicio createState() => _Inicio();
}

class _Inicio extends State<inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //início da tela
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Flexible(
                child: Image.asset(
              "assets/images/takemychild.png",
            )),
            Flexible(
              child: Column(
                children: [
                  Text("Seja bem-vindo(a)!"),
                  TextButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/acessomotorista'),
                      child: Text("Acesso motorista"),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.yellow),
                      )),
                  TextButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/acessopais'),
                      child: Text("Acesso pais"),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.yellow),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
