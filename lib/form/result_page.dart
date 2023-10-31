import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String username;
  final String email;
  final double budget;
  final List<String> interests;

  ResultPage({
    required this.username,
    required this.email,
    required this.budget,
    required this.interests,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultados del Formulario"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildResultItem("Nombre:", username),
            _buildResultItem("Correo:", email),
            _buildResultItem("Presupuesto:", "\$$budget"),
            _buildResultItem("Intereses:", interests.join(", ")),
          ],
        ),
      ),
    );
  }

  Widget _buildResultItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
