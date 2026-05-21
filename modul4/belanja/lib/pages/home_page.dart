import 'package:flutter/material.dart';
import '../models/item.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Sugar', price: 5000, category: 'Bahan Pokok'),
    Item(name: 'Salt', price: 2000, category: 'Bahan Pokok'),
    Item(name: 'Rice', price: 15000, category: 'Bahan Pokok'),
    Item(name: 'Shampoo', price: 20000, category: 'Perawatan'),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.pushNamed(context, '/item', arguments: item);
                },
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      const Icon(Icons.shopping_cart, color: Colors.teal),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          item.name,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Text(
                        'Rp ${item.price}',
                        style: const TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}