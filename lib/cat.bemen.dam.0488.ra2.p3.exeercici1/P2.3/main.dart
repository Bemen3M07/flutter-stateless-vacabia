import 'package:flutter/material.dart';
import 'main_1.dart';
import 'main_2.dart';
import 'main_3.dart';
import 'main_4.dart';
import 'main_5.dart';
import 'main_6.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainMenu(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Executar diferents mains"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            buildButton(context, "Run main1", const MainApp1()),
            buildButton(context, "Run main2", const MainApp2()),
            buildButton(context, "Run main3", const MainApp3()),
            buildButton(context, "Run main4", const MainApp4()),
            buildButton(context, "Run main5", const MainApp5()),
            buildButton(context, "Run main6", const MainApp6()),
          ],
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, String text, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 5, 5, 238),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
