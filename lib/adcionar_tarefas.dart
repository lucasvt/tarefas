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
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
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
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Informe o nome da tarefa',
              labelText: 'Nome da Tarefa',
              icon: const Icon(Icons.paste_outlined,
                  color: Color.fromARGB(255, 26, 95, 233)),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Informe a data da Data',
              labelText: 'Selecione a Data',
              icon: const Icon(Icons.calendar_today,
                  color: Color.fromARGB(255, 26, 95, 233)),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Informe o horário da tarefa',
              labelText: 'Informe o Horário',
              icon: const Icon(Icons.punch_clock,
                  color: Color.fromARGB(255, 26, 95, 233)),
            ),
          ),
          DropdownButton<String>(
            value: dropdownEstado,
            icon: const Icon(Icons.arrow_downward, color: Colors.blue),
            elevation: 16,
            style: const TextStyle(color: Colors.blue),
            underline: Container(
              height: 2,
              color: Colors.blue,
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
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward, color: Colors.blue),
            elevation: 16,
            style: const TextStyle(color: Colors.blue),
            underline: Container(
              height: 2,
              color: Colors.blue,
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
