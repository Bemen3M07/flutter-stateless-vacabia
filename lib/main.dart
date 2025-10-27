import 'package:flutter/material.dart';
import 'package:empty/cat.bemen.dam.0488.ra2.p3.exeercici1/main_1.dart' as ap1;
import 'package:empty/cat.bemen.dam.0488.ra2.p3.exeercici1/main_2.dart' as ap2;
import 'package:empty/cat.bemen.dam.0488.ra2.p3.exeercici1/main_3.dart' as ap3;
import 'package:empty/cat.bemen.dam.0488.ra2.p3.exeercici1/main_4.dart' as ap4;
import 'package:empty/cat.bemen.dam.0488.ra2.p3.exeercici1/main_5.dart' as ap5;
import 'package:empty/cat.bemen.dam.0488.ra2.p3.exeercici1/main_6.dart' as ap6;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Column(
          children: [ap1.MainApp(),ap2.MainApp(),ap3.MainApp(), ap4.MainApp(), ap5.MainApp(), ap6.MainApp()],
        ),
      ),
    );
  }
}
