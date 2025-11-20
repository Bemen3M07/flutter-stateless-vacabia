import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Importar todos los ejercicios
import 'main_1.dart';
import 'main_2.dart';
import 'main_3.dart';
import 'main_4.dart';
import 'main_5.dart';
import 'main_6.dart';
import 'main_7.dart';

class MainApp8 extends StatefulWidget {
  const MainApp8({super.key});

  @override
  State<MainApp8> createState() => _MainApp8State();
}

class _MainApp8State extends State<MainApp8> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: const MaterialApp(
        home: NavigationScreen(),
      ),
    );
  }
}

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ejercicio ${navigationProvider.currentExerciseIndex + 1}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF2C3E50),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF2C3E50),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.list_alt,
                    size: 60,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Lista de Ejercicios',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(context, 0, 'Ejercicio 1', Icons.looks_one),
            _buildDrawerItem(context, 1, 'Ejercicio 2', Icons.looks_two),
            _buildDrawerItem(context, 2, 'Ejercicio 3', Icons.looks_3),
            _buildDrawerItem(context, 3, 'Ejercicio 4 - Dados', Icons.looks_4),
            _buildDrawerItem(context, 4, 'Ejercicio 5 - Counter', Icons.looks_5),
            _buildDrawerItem(context, 5, 'Ejercicio 6 - Shopping List', Icons.looks_6),
            _buildDrawerItem(context, 6, 'Ejercicio 7 - Provider', Icons.filter_7),

          ],
        ),
      ),
      body: _buildCurrentExercise(navigationProvider.currentExerciseIndex),
    );
  }

  Widget _buildDrawerItem(BuildContext context, int index, String title, IconData icon) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final isSelected = navigationProvider.currentExerciseIndex == index;
    
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? const Color(0xFF3498DB) : Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? const Color(0xFF3498DB) : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: const Color(0xFF3498DB).withOpacity(0.1),
      onTap: () {
        navigationProvider.setExerciseIndex(index);
        Navigator.pop(context); 
      },
    );
  }

  Widget _buildCurrentExercise(int exerciseIndex) {
    switch (exerciseIndex) {
      case 0:
        return const MainApp1();
      case 1:
        return const MainApp2();
      case 2:
        return const MainApp3();
      case 3:
        return const MainApp4(); 
      case 4:
        return const MainApp5();
      case 5:
        return const MainApp6();
      default:
        return const MainApp7();
    }
  }

  Widget _buildExercisePlaceholder(String title, String className) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.construction,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Importar: $className',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

// Provider para gestionar la navegación
class NavigationProvider extends ChangeNotifier {
  int _currentExerciseIndex = 0; // Por defecto el ejercicio 1

  int get currentExerciseIndex => _currentExerciseIndex;

  void setExerciseIndex(int index) {
    _currentExerciseIndex = index;
    notifyListeners();
  }
}