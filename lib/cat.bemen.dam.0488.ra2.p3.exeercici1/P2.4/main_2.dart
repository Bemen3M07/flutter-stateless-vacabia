import 'package:flutter/material.dart';

class MainApp2 extends StatefulWidget {
  const MainApp2({super.key});

  @override
  State<MainApp2> createState() => _MainApp2State();
}

class _MainApp2State extends State<MainApp2> {
  final TextEditingController _nombreController = TextEditingController();
  String _mensaje = '';

  @override
  void dispose() {
    _nombreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _nombreController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 52, 73, 94),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _mensaje = "Hola ${_nombreController.text}";
                    });
                  },
                  child: const Text(
                    "Dime tu nombre",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                if (_mensaje.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _mensaje,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
              ],
            ),
          )
        )
      )
    );
  }
}