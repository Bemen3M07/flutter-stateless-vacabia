import 'package:flutter/material.dart';

class MainApp6 extends StatefulWidget {
  const MainApp6({super.key});

  @override
  State<MainApp6> createState() => _MainApp6State();
}

class _MainApp6State extends State<MainApp6> {
  final List<ShoppingItem> _items = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  void _addItem() {
    if (_nameController.text.isNotEmpty &&
        _quantityController.text.isNotEmpty) {
      setState(() {
        _items.add(
          ShoppingItem(
            name: _nameController.text,
            quantity: int.tryParse(_quantityController.text) ?? 1,
          ),
        );
        _nameController.clear();
        _quantityController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, rellena todos los campos'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  void _clearList() {
    setState(() {
      _items.clear();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Shopping List',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFF27AE60),
          centerTitle: true,
          actions: [
            if (_items.isNotEmpty)
              IconButton(
                icon: const Icon(Icons.delete_sweep, color: Colors.white),
                onPressed: _clearList,
                tooltip: 'Limpiar lista',
              ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF2ECC71),
                Color(0xFF27AE60),
              ],
            ),
          ),
          child: Column(
            children: [
              // Formulario para añadir items
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Campo nombre
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Nombre del producto',
                        hintText: 'Ej: Pan, Leche...',
                        prefixIcon: const Icon(
                          Icons.shopping_basket,
                          color: Color(0xFF27AE60),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFF27AE60),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Campo cantidad
                    TextField(
                      controller: _quantityController,
                      decoration: InputDecoration(
                        labelText: 'Cantidad',
                        hintText: 'Ej: 2',
                        prefixIcon: const Icon(
                          Icons.format_list_numbered,
                          color: Color(0xFF27AE60),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFF27AE60),
                            width: 2,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 15),
                    // Botón añadir
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _addItem,
                        icon: const Icon(Icons.add, color: Colors.white),
                        label: const Text(
                          'AÑADIR A LA LISTA',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF27AE60),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Lista de items
              Expanded(
                child: _items.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 80,
                              color: Colors.white70,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'La lista está vacía',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          final item = _items[index];
                          return _buildShoppingItem(item, index);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para construir cada item de la lista
  Widget _buildShoppingItem(ShoppingItem item, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF27AE60).withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              '${item.quantity}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF27AE60),
              ),
            ),
          ),
        ),
        title: Text(
          item.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          item.quantity == 1 ? 'unidad' : 'unidades',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => _removeItem(index),
        ),
      ),
    );
  }
}

// Clase para representar un item de la lista
class ShoppingItem {
  final String name;
  final int quantity;

  ShoppingItem({
    required this.name,
    required this.quantity,
  });
}