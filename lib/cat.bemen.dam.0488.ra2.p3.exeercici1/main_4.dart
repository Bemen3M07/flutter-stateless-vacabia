import 'package:flutter/material.dart';

class MainApp4 extends StatelessWidget {
  const MainApp4({super.key});

  @override
  Widget build(BuildContext context) {
    // Crear el objeto de tipo Contact con los datos requeridos
    Contact contacto = Contact(
      fullName: "Edim CasaBatallas",
      email: "marta_vuelve_conmigo_please@example.com",
      phone: "934748474"
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 44, 121, 238),
          title: const Text(
            "Contact",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Imagen de perfil circular
              CircleAvatar(
                radius: 60,
                backgroundColor: const Color.fromARGB(255, 44, 121, 238),
                backgroundImage: const AssetImage('assets/edim.jpg'),
              ),
                const SizedBox(height: 30),

                // Nombre completo
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.person_outline, color: Colors.grey),
                    const SizedBox(width: 10),
                    Text(
                      contacto.fullName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Email
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.email_outlined, color: Colors.grey),
                    const SizedBox(width: 10),
                    Text(
                      contacto.email,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Teléfono
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.phone_outlined, color: Colors.grey),
                    const SizedBox(width: 10),
                    Text(
                      contacto.phone,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Clase Contact con los atributos requeridos
class Contact {
  String fullName;
  String email;
  String phone;

  Contact({
    required this.fullName,
    required this.email,
    required this.phone,
  });
}