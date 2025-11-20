import 'package:flutter/material.dart';
import 'dart:math';

class MainApp4 extends StatefulWidget {
  const MainApp4({super.key});

  @override
  State<MainApp4> createState() => _MainApp4State();
}

class _MainApp4State extends State<MainApp4> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DiceGameScreen(),
    );
  }
}

class DiceGameScreen extends StatefulWidget {
  const DiceGameScreen({super.key});

  @override
  State<DiceGameScreen> createState() => _DiceGameScreenState();
}

class _DiceGameScreenState extends State<DiceGameScreen> {
  int _dado1 = 1;
  int _dado2 = 1;
  final Random _random = Random();

  void _rollDice() {
    setState(() {
      _dado1 = _random.nextInt(6) + 1;
      _dado2 = _random.nextInt(6) + 1;
    });

    // Comprobar jackpot después del setState
    if (_dado1 == 6 && _dado2 == 6) {
      _showJackpotToast();
    }
  }

  void _showJackpotToast() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'JACKPOT!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1B5E5E),
              Color(0xFF0D3D3D),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: const Color(0xFF0D3D3D),
                child: const Center(
                  child: Text(
                    'Gambling',
                    style: TextStyle(
                      color: Color(0xFFE74C3C),
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF5C6B7C),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Roll the dice',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Dado 1
                            _buildDice(_dado1),
                            const SizedBox(width: 20),
                            // Dado 2
                            _buildDice(_dado2),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _rollDice,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5C6B7C),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'ROLL THE DICE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método auxiliar para construir cada dado
  Widget _buildDice(int value) {
    return Image.asset(
      'assets/images/dice_$value.png',
      width: 100,
      height: 100,
      errorBuilder: (context, error, stackTrace) => Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            '$value',
            style: const TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}