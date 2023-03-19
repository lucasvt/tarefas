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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tarefas"),
          backgroundColor: Colors.blue,
          
          
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    color: Color.fromARGB(255, 16, 60, 96),
                  ),
                  Icon(
                    IconData(0xf117, fontFamily: 'MaterialIcons'),
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
