import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PencarianPage extends StatelessWidget {
  const PencarianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,

        title: const Text(
          'Pencarian',
          style: TextStyle(
            color: Color(0xFF583410),
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Box
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                  ),
                ],
              ),

              child: TextField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.search),
                  hintText: 'Cari budaya...',
                  border: InputBorder.none,

                  suffixIcon: IconButton(
                    onPressed: () {
                      Get.snackbar(
                        'Pencarian',
                        'Fitur pencarian sedang digunakan',
                        snackPosition: SnackPosition.BOTTOM,
                        duration: const Duration(seconds: 2),
                      );
                    },
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Title
            const Text(
              'Pencarian terkini',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6B3E11),
              ),
            ),

            const SizedBox(height: 16),

            // Chips
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildSearchChip('Bahasa Daerah'),
                _buildSearchChip('Pakaian Adat'),
                _buildSearchChip('Tari'),
                _buildSearchChip('Rumah Joglo'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Method untuk membuat chip
  Widget _buildSearchChip(String label) {
    return GestureDetector(
      onTap: () {
        Get.snackbar(
          'Pencarian',
          'Kamu memilih: $label',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
        );
      },

      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFF6B3E11).withOpacity(0.3),
          ),
        ),

        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF6B3E11),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}