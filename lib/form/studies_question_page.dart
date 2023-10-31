import 'package:flutter/material.dart';

class StudiesQuestionPage extends StatefulWidget {
  final String username;
  final Function(List<String>) onNext; // Cambia el tipo de función para que acepte una lista de cadenas

  StudiesQuestionPage({Key? key, required this.username, required this.onNext})
      : super(key: key);

  @override
  _StudiesQuestionPageState createState() => _StudiesQuestionPageState();
}


class _StudiesQuestionPageState extends State<StudiesQuestionPage> {
  List<String> selectedInterests = [];
  final List<String> allInterests = [
    "Desarrollo web",
    "Desarrollo móvil",
    "Ciberseguridad",
    "Inteligencia Artificial",
    "Aprendizaje automático",
    "Realidad virtual",
    "Big Data",
    "IoT (Internet de las cosas)",
    "Blockchain",
    "Diseño de interfaces de usuario",
    "Programación en la nube",
    "Robótica",
    "Gestión de proyectos de software",
    "Automatización de procesos",
    "Redes informáticas",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Áreas de Asesoramiento Profesional"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: allInterests.length,
        itemBuilder: (context, index) {
          final interest = allInterests[index];
          final isSelected = selectedInterests.contains(interest);

          return ListTile(
            title: Text(interest),
            trailing: isSelected ? Icon(Icons.cloud_done) : Icon(Icons.cloud),
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedInterests.remove(interest);
                } else {
                  selectedInterests.add(interest);
                }
              });
            },
          );
        },
      ),
     floatingActionButton: FloatingActionButton(
  onPressed: () {
    widget.onNext(selectedInterests);
  },
  child: Icon(Icons.check),
),

    );
  }
}
