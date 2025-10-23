import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome!',  style: TextStyle(fontSize: 32),),
              SizedBox(height: 20,),
              Text ('Start learning now', style: TextStyle(fontSize: 16),)
              ])
        ),
      ),
    );
  }
}
