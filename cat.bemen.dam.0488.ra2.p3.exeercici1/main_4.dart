import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 44, 121, 238),
          title: const Text(
            "Lista de Contactos",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Contacto"),
             // Text(Contactos.fullName)
            ],
          ),
        ),
      ),
    );
  }
}

class Contactos {
  String fullName = "Pax1";
  String email = "FacciaMucca@json.com";
  int phone = 6531854612;
}
