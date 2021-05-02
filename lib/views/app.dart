import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_my_child/views/Acesso_Motorista.dart';
import 'package:take_my_child/views/acesso_pais.dart';
import 'package:take_my_child/views/cadastrar_aluno.dart';
import 'package:take_my_child/views/cadastro_motorista.dart';
import 'package:take_my_child/views/cadastro_van.dart';
import 'package:take_my_child/views/inicio.dart';
import 'package:take_my_child/views/pagina_inicial.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Método responsável por desenhar a tela do aplicativo.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: inicio(),
      routes: {
        '/': (context) => inicio(),
        '/acessomotorista': (context) => acesso_motorista(),
        '/acessopais': (context) => acesso_pais(),
        '/cadastromotorista': (context) => cadastro_motorista(),
        '/cadastrovan': (context) => cadastro_van(),
        '/cadastroaluno': (context) => cadastro_aluno(),
        '/paginainicial': (context) => pagina_inicial(),
      },
      initialRoute: '/',
    );
    // o home vai indicar qual é a tela inicial da aplicação
  }
}
