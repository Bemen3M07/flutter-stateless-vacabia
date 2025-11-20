import 'package:flutter/material.dart';

class MainApp5 extends StatefulWidget {
  const MainApp5({super.key});

  @override
  State<MainApp5> createState() => _MainApp5State();
}

class _MainApp5State extends State<MainApp5> {
  int _scoreLocal = 0;
  int _scoreVisitante = 0;

  void _incrementLocal() {
    setState(() {
      _scoreLocal++;
    });
  }

  void _decrementLocal() {
    setState(() {
      if (_scoreLocal > 0) {
        _scoreLocal--;
      }
    });
  }

  void _incrementVisitante() {
    setState(() {
      _scoreVisitante++;
    });
  }

  void _decrementVisitante() {
    setState(() {
      if (_scoreVisitante > 0) {
        _scoreVisitante--;
      }
    });
  }

  void _resetScores() {
    setState(() {
      _scoreLocal = 0;
      _scoreVisitante = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Counter',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFF2C3E50),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh, color: Colors.white),
              onPressed: _resetScores,
              tooltip: 'Reset',
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF34495E),
                Color(0xFF2C3E50),
              ],
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Título del partido
              const Text(
                'MARCADOR',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 40),
              // Marcador
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Equipo Local
                  _buildTeamScore(
                    'LOCAL',
                    _scoreLocal,
                    const Color(0xFF3498DB),
                    _incrementLocal,
                    _decrementLocal,
                  ),
                  // Separador
                  const Text(
                    ':',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Equipo Visitante
                  _buildTeamScore(
                    'VISITANTE',
                    _scoreVisitante,
                    const Color(0xFFE74C3C),
                    _incrementVisitante,
                    _decrementVisitante,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para construir cada equipo con su marcador
  Widget _buildTeamScore(
    String teamName,
    int score,
    Color color,
    VoidCallback onIncrement,
    VoidCallback onDecrement,
  ) {
    return Column(
      children: [
        // Nombre del equipo
        Text(
          teamName,
          style: TextStyle(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 20),
        // Marcador
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.5),
                blurRadius: 15,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Center(
            child: Text(
              '$score',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Botones
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Botón decrementar
            IconButton(
              onPressed: onDecrement,
              icon: const Icon(Icons.remove_circle),
              color: Colors.white,
              iconSize: 40,
            ),
            const SizedBox(width: 20),
            // Botón incrementar
            IconButton(
              onPressed: onIncrement,
              icon: const Icon(Icons.add_circle),
              color: Colors.white,
              iconSize: 40,
            ),
          ],
        ),
      ],
    );
  }
}