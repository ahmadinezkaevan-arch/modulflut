import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'search_page.dart';
import '../controllers/main_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 57),
            _buildHeaderBanner(),
            const SizedBox(height: 14),
            _buildKategoriSection(),
            const SizedBox(height: 22),
            _buildQuizTerkiniSection(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ================= HEADER =================
  // tombol dibuat nonaktif (tidak menuju halaman lain)
  Widget _buildHeaderBanner() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/backgroundatas.jpeg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Tes Wawasan Budaya Jawa',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Uji seberapa dalam pengetahuanmu tentang\nkebudayaan yang ada di Jawa',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6A3E12),
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 6,
            ),
            child: const Text(
              'Mulai Sekarang',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= KATEGORI =================
  // tombol dibuat nonaktif
  Widget _buildKategoriSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Kategori',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF583410),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'lihat semua',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF583410),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildKategoriCard(
                  'Rumah Adat',
                  'assets/images/rumahjoglo.png',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildKategoriCard(
                  'Tarian Adat',
                  'assets/images/tarian.png',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildKategoriCard(
                  'Pakaian Adat',
                  'assets/images/pakaianadat.png',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKategoriCard(String title, String imagePath) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF583410).withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    const Color(0xFF583410).withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= QUIZ TERKINI =================
  // item quiz dibuat nonaktif
  Widget _buildQuizTerkiniSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Quiz Terkini',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6B4423),
            ),
          ),
        ],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const Color brownColor = Color(0xFF583410);

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.put(MainController());

    final List<Widget> pages = [
      const HomePage(),
      const PencarianPage(),
    ];

    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: pages,
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: brownColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _navItem(Icons.home, 0, controller),
                _navItem(Icons.search, 1, controller),
                _navItem(Icons.bookmark, 2, controller),
                _navItem(Icons.person, 3, controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(
    IconData icon,
    int index,
    MainController controller,
  ) {
    final bool isActive =
        controller.currentIndex.value == index;

    return GestureDetector(
      onTap: () {
        controller.changePage(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 24,
          color: isActive ? brownColor : Colors.white,
        ),
      ),
    );
  }
}