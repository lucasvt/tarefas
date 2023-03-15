import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                  Container(height: 50, color: Colors.blue),
                  Container(
                      height: 652,
                      color: Color.fromARGB(255, 12, 44, 70),
                      child:
                          Center(child: Text("lista de tarefas")))
                ],
              )),
            ),
            Container(
                height: 50,
                color: Colors.blue,
                child: Center(child: Text("Propagandas chatas do caramba!")))
          ],
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      ),
    );
  }
}
