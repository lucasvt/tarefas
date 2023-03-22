import 'package:flutter/material.dart';

import 'adcionar_tarefas.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
);

void main() => runApp(MaterialApp(home: MyApp()));
const List<String> list = <String>['Pessoal', 'Trabalho', 'Estudo', 'Lazer'];
const List<String> listEstado = <String>[
  'Aberto',
  'Concluido',
  'excluido',
  'aguardando Liberação'
];

class MyApp extends StatelessWidget {
  List _listaTarefas = ["Ir ao mercado", "estudar", "Pedalar"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text("Tarefas"),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.home),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(IconData(0xe3c7, fontFamily: 'MaterialIcons')),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  Container(
                      height: 600,
                      color: Color.fromARGB(255, 12, 44, 70),
                      child: Center(child: Text("Lista de tarefas")))
                ],
              )),
            ),
            Container(
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdicionarTarefas()),
                  );
                },
                child: Text('Adicionar Nova tarefa'),
              ),
            ),
            Container(
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Informe o nome da tarefa',
                  icon: Icon(Icons.mic,
                      color: Color.fromARGB(255, 253, 253, 253)),
                  labelText: 'Nome da Tarefa',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
