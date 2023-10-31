import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class EmailQuestionPage extends StatefulWidget {
  final String username;
  final Function(String) onNext;

  EmailQuestionPage({Key? key, required this.username, required this.onNext}) : super(key: key);

  @override
  _EmailQuestionPageState createState() => _EmailQuestionPageState();
}

class _EmailQuestionPageState extends State<EmailQuestionPage> {
  String email = '';
  bool isEmailValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Correo Electrónico'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '¿Cuál es tu correo electrónico?',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  email = value;
                  isEmailValid = EmailValidator.validate(email);
                });
              },
              decoration: InputDecoration(
                labelText: 'ejemplo@gmail.com',
                border: OutlineInputBorder(),
                errorText: isEmailValid ? null : 'Correo electrónico no válido',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (isEmailValid) {
                  widget.onNext(email);
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
