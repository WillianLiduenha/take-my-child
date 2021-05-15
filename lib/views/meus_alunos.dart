import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MeusAlunos extends StatefulWidget {
  @override
  _MeusAlunosState createState() => _MeusAlunosState();
}

class _MeusAlunosState extends State<MeusAlunos> {
  // initState() {
  //   super.initState();
  //   this.tarefas = repository.read();
  // }

  // Future<void> adicionarTarefa(BuildContext context) async {
  //   var result = await Navigator.of(context).pushNamed('/nova');
  //   setState(() {
  //     if (result != null && result == true) {
  //       this.tarefas = repository.read();
  //       ordenar(tarefas);
  //     }
  //   });
  // }

  // Future<bool> confirmarExclusao(BuildContext context) async {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (_) {
  //       return AlertDialog(
  //         title: Text("Confirma a exclusão?"),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.of(context).pop(false),
  //             child: Text("Não"),
  //           ),
  //           TextButton(
  //             onPressed: () => Navigator.of(context).pop(true),
  //             child: Text("Sim"),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // Future<void> editarTarefas(BuildContext context, Tarefa tarefa) async {
  //   {
  //     var result = await Navigator.of(context).pushNamed(
  //       '/edita',
  //       arguments: tarefa,
  //     );
  //     setState(() {
  //       if (result != null && result == true) {
  //         this.tarefas = repository.read();
  //         ordenar(tarefas);
  //       }
  //     });
  //   }
  // }

  // double total(List<Tarefa> tarefas) {
  //   double totalzin = 0;
  //   tarefas.forEach((element) {
  //     element.ativo
  //         ? totalzin += element.valor * element.qtd
  //         : totalzin; // Linha desnecessária, poderia ser resolvido com um if apenas e não ternário
  //   });
  //   return totalzin;
  // }

  // bool canEdit = false;

  // void ordenar(List<Tarefa> tarefa) {
  //   tarefa.sort((a, b) => b.ativo ? 1 : -1);
  //   tarefa.sort((a, b) {
  //     if (!a.ativo) {
  //       return -1;
  //     }

  //     //Ex.: Após a ordenação
  //     // if (a.finalizada) {
  //     //   return 1;
  //     // }
  //     // return -1;

  //     return a.finalizada ? 1 : -1; // EX.: ternário
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.yellow,
        title: Text(
          "Meus alunos",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 9,
            child: ListView.builder(
 itemCount: 3,
              itemBuilder: (_, indice) {
                return Card(
                  
                  child: ListTile(
                    title: Text("teste"),
                  ),
                );
              },
            ), // criar a lista com os dados do read();
          ),
        ],
      ),
    );
  }
}
