import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_my_child/views/cadastrar_aluno.dart';
import 'package:take_my_child/views/cadastrar_pais.dart';
import 'package:take_my_child/views/cadastro_motorista.dart';
import 'package:take_my_child/views/cadastro_van.dart';
import 'package:take_my_child/views/inicio.dart';
import 'package:take_my_child/views/pagina_inicial.dart';

import 'acesso.dart';
import 'editar_aluno.dart';
import 'editar_motorista.dart';
import 'editar_pais.dart';
import 'editar_van.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Método responsável por desenhar a tela do aplicativo.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: inicio(),
      routes: {
        '/': (context) => inicio(),
        '/acesso': (context) => acesso(),
        '/cadastromotorista': (context) => cadastro_motorista(),
        '/cadastrovan': (context) => cadastro_van(),
        '/cadastroaluno': (context) => cadastro_aluno(),
        '/cadastropais': (context) => cadastrar_pais(),
        
        '/editarmotorista': (context) => Editar_motorista(),
        '/editarvan': (context) => Editar_van(),
        '/editaraluno': (context) => editar_aluno(),
        '/editarpais': (context) => editar_pais(),

        '/paginainicial': (context) => pagina_inicial(),
      },
      initialRoute: '/acesso',
    );
    // o home vai indicar qual é a tela inicial da aplicação
  }
}
