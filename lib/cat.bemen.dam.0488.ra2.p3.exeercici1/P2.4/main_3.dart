import 'package:flutter/material.dart';
import 'dart:math';

class MainApp3 extends StatefulWidget {
  const MainApp3({super.key});

  @override
  State<MainApp3> createState() => _MainApp3State();
}

class _MainApp3State extends State<MainApp3> {
  final TextEditingController _numeroController = TextEditingController();
  int _numeroSecreto = Random().nextInt(100) + 1; // numero aleatorio entre 1 y 100
  int _intentos = 0;
  String _mensaje = '';

  void _validar() {
    setState(() {
      
      int numeroIngresado = int.tryParse(_numeroController.text) ?? 0;

      if (numeroIngresado == _numeroSecreto) {
        _mensaje = '¡Correcte! Ho has endevinat en $_intentos intents';
      } else if (numeroIngresado < _numeroSecreto) {
        _mensaje = 'El número que busques és més gran';
        _intentos++;
      } else {
        _mensaje = 'El número que busques és més petit';
        _intentos++;
      }
    });
  }

  void _reiniciar() {
    setState(() {
      _numeroSecreto = Random().nextInt(100) + 1;
      _intentos = 0;
      _mensaje = '';
      _numeroController.clear();
    });
  }

  @override
  void dispose() {
    _numeroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Adivina el número'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Endevina el número secret',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _numeroController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '1 - 100',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 52, 73, 94),
                    ),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                  ),
                  onPressed: _validar,
                  child: const Text(
                    "Validar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Intents: $_intentos',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                if (_mensaje.isNotEmpty)
                  Text(
                    _mensaje,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 20),
                if (_mensaje.contains('¡Correcte!'))
                  ElevatedButton(
                    onPressed: _reiniciar,
                    child: const Text('Jugar de nou'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}