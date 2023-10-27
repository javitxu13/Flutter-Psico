import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/LoginScreen.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido $username'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Esta es tu página de inicio'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Agrega la lógica de cierre de sesión aquí
                // Navega de vuelta a la pantalla de inicio de sesión (LoginScreen)
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Text('Cerrar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
