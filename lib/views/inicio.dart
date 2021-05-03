import 'dart:math';

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
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromRGBO(
                      240, 230, 140, 0.4), //primeira cor, que vem de baixo
                  Color.fromRGBO(
                      255, 215, 0, 0.695), //segunda cor, que vem de cima
                ],
                stops: [0.2, 0.8],
                transform: GradientRotation(2.5 * pi))),
        width: double.infinity,
        child: Column(
          children: [
            Flexible(
              child: Column(
                children: [
                  SizedBox(height: 120),
                  Image.asset(
                    "assets/images/van.png",
                    width: 200,
                  ),
                  Text(
                    "Take my child!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  Text(
                    "Seja bem-vindo(a)!",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Este é seu primeiro acesso ao TakeMyChild, neste aplicativo facilitaremos tanto para Motoristas de Vans quanto aos Pais corujas!",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    width: double.maxFinite,
                    child: TextButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/acesso'),
                      child: Text(
                        "Acesso ao sistema",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.yellow),
                      ),
                    ),
                  ),
                  Text("Seus filhos seguros com TakeMyChild."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
