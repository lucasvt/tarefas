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
          title: Text("Tarefas"),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: Icon(IconData(0xe3c7, fontFamily: 'MaterialIcons')),
              onPressed: () {
                // do something
              },
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _listaTarefas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_listaTarefas[index]),
                  );
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    color: Color.fromARGB(255, 16, 60, 96),
                  ),
                  Container(
                      height: 652,
                      color: Color.fromARGB(255, 12, 44, 70),
                      child: Center(child: Text("Lista de tarefas")))
                ],
              )),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdicionarTarefas()),
                );
              },
              child: Text('Adicionar Nova tarefa'),
            ),
            Container(
              height: 50,
              width: 400,
              color: Colors.blue,
              child: Text('Pesquisar Tarefa'),
            )
          ],
        ),
      ),
    );
  }
}
