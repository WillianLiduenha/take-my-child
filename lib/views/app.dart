import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:take_my_child/views/alunos_presentes.dart';
import 'package:take_my_child/views/ausencia_aluno.dart';
import 'package:take_my_child/views/cadastrar_aluno.dart';
import 'package:take_my_child/views/cadastrar_pais.dart';
import 'package:take_my_child/views/cadastro_motorista.dart';
import 'package:take_my_child/views/cadastro_van.dart';
import 'package:take_my_child/views/inicio.dart';
import 'package:take_my_child/views/meus_alunos.dart';
import 'package:take_my_child/views/pagina_inicial_pais.dart';
import 'package:take_my_child/views/vincular_motorista.dart';

import 'acesso.dart';
import 'editar_aluno.dart';
import 'editar_motorista.dart';
import 'editar_pais.dart';
import 'editar_van.dart';
import 'pagina_inicial_motorista.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Método responsável por desenhar a tela do aplicativo.
    return MaterialApp(
      supportedLocales: [const Locale('pt', 'BR')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      debugShowCheckedModeBanner: false,
      // home: inicio(),
      routes: {
        '/': (context) => inicio(),
        '/acesso': (context) => acesso(),
        '/cadastromotorista': (context) => cadastro_motorista(),
        '/cadastrovan': (context) => cadastro_van(),
        '/cadastroaluno': (context) => cadastro_aluno(),
        '/cadastropais': (context) => cadastrar_pais(),
        '/editarmotorista': (context) => editar_motorista(),
        '/editarvan': (context) => editar_van(),
        '/editaraluno': (context) => editar_aluno(),
        '/editarpais': (context) => editar_pais(),
        '/paginainicialmotorista': (context) => pagina_inicial_motorista(),
        '/paginainicialpais': (context) => pagina_inicial_pais(),
        '/meusalunos': (context) => MeusAlunos(),
        '/vincularmotorista': (context) => vincular_motorista(),
        '/ausenciaaluno': (context) => AusenciaAluno(),
        '/alunospresentes': (context) => AlunosPresentes(),
      },

      initialRoute: '/',
    );
    // o home vai indicar qual é a tela inicial da aplicação
  }
}
