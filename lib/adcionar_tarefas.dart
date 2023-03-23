import 'package:flutter/material.dart';
import 'package:tarefas/main.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() => runApp(AdicionarTarefas());

class AdicionarTarefas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Adicionar Tarefas';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(appTitle),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
            icon: Icon(Icons.home),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
              icon: Icon(Icons.close),
            ),
          ],
        ),
        body: const MyCustomForm(),
        backgroundColor: Color.fromARGB(255, 12, 44, 70),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
    String dropdownEstado = listEstado.first;
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Informe o nome da tarefa',
                icon:
                    Icon(Icons.work, color: Color.fromARGB(255, 255, 255, 255)),
                labelText: 'Nome da Tarefa',
                suffixIcon:
                    Icon(Icons.mic, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Informe a data!',
                labelText: 'Data de Inicio da tarefa',
                icon: const Icon(Icons.calendar_today,
                    color: Color.fromARGB(255, 255, 255, 255)),
                suffixIcon: const Icon(Icons.close,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            child: TextFormField(
              style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              decoration: const InputDecoration(
                hintText: 'Informe data prevista para conclusão',
                labelText: 'Informe a data prevista de Conclusão!',
                icon: const Icon(Icons.calendar_today,
                    color: Color.fromARGB(255, 255, 255, 255)),
                suffixIcon: const Icon(Icons.close,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            child: TextFormField(
              style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              decoration: const InputDecoration(
                hintText: 'Informe data de conclusão',
                labelText: 'Informe a data de Conclusão!',
                icon: const Icon(Icons.calendar_today,
                    color: Color.fromARGB(255, 255, 255, 255)),
                suffixIcon: const Icon(Icons.close,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            child: DropdownButton<String>(
              value: dropdownEstado,
              icon: const Icon(Icons.arrow_downward, color: Colors.white),
              elevation: 16,
              style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              underline: Container(
                height: 2,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownEstado = value!;
                });
              },
              items: listEstado.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward, color: Colors.white),
              elevation: 16,
              style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              underline: Container(
                height: 2,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Enviar'),
            ),
          ),
        ],
      ),
    );
  }
}
