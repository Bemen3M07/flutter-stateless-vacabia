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
        body:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('This is a resource string', 
              style: TextStyle(fontSize: 20),),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Image(
                image: AssetImage('edim.jpg'),
                width: 200,
                height: 200,),
                ) 
            ],
        ),
      ),
    );
  }
}
