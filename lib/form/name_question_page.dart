import 'package:flutter/material.dart';

class NameQuestionPage extends StatefulWidget {
  final String username;
  final Function(String) onNext; // Cambia el tipo de la función a que acepte un String

  NameQuestionPage({Key? key, required this.username, required this.onNext}) : super(key: key);

  @override
  _NameQuestionPageState createState() => _NameQuestionPageState();
}

class _NameQuestionPageState extends State<NameQuestionPage> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuestionario de Nombre'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '¿Cuál es tu nombre?',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (name.isNotEmpty) {
                  widget.onNext(name); // Pasa el nombre al presionar el botón "Siguiente"
                }
              },
              child: Text('Siguiente'),
            ),
          ],
        ),
      ),
    );
  }
}
