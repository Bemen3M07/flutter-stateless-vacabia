import 'package:flutter/material.dart';

class MainApp1 extends StatefulWidget {
  const MainApp1({super.key});

  @override
  State<MainApp1> createState() => _MainApp1State();
}

class _MainApp1State extends State<MainApp1> {
  String greeting = 'Good ?!';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                greeting,
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 255, 0, 0),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    greeting = "Good Morning!";
                  });
                }, 
                child: const Text(
                  "Morning",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 255, 0, 0),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    greeting = "Good Night!";
                  });
                }, 
                child: const Text(
                  "Night",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}