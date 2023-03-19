import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() => runApp(AdicionarTarefas());

class AdicionarTarefas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Novas Tarefas"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  Container(
                    height: 0,
                    color: Color.fromARGB(255, 12, 44, 70),
                  ),
                  Icon(
                    IconData(
                      0xe093,
                      fontFamily: 'MaterialIcons',
                      matchTextDirection: true,
                    ),
                  ),
                  Container(
                      height: 652,
                      color: Color.fromARGB(255, 12, 44, 70),
                      child: Center(child: Text("crud")))
                ],
              )),
            ),
            Container(
              height: 50,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
