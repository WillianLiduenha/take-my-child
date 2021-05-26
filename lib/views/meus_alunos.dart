import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_my_child/models/parents.model.dart';

class MeusAlunos extends StatefulWidget {
  @override
  _MeusAlunosState createState() => _MeusAlunosState();
}

class _MeusAlunosState extends State<MeusAlunos> {
  ParentsModel _responsaveis = new ParentsModel();
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
    _responsaveis = ModalRoute.of(context).settings.arguments;
    
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
              itemCount: 15,
              itemBuilder: (_, indice) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Card(
                        color: Color.fromARGB(255, 255, 255, 224),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: ListTile(
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Nome do Aluno:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    Text(
                                      "Will",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Nome Responsável:"),
                                        Text("Aline"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Text("Telefone contato:"),
                                        Text("12345678912"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Text("Endereço:"),
                                        Text("Endereço endereço"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Text("Escola:"),
                                        Text("Fatec"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 2,
                      width: double.infinity,
                      color: Colors.black,
                    ),
                    SizedBox(height: 5),
                  ],
                );
              },
            ), // criar a lista com os dados do read();
          ),
        ],
      ),
    );
  }
}
