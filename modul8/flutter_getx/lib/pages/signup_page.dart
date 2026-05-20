import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_page.dart';
import 'main_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 110),

              // JUDUL
              Text(
                'Daftar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF583410),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: 0.13),
                      offset: const Offset(0, 4),
                      blurRadius: 12,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 57),

              // USERNAME
              const Text(
                'Username',
                style: TextStyle(
                  color: Color(0xFF583410),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 8),

              _buildInputField(
                controller: _usernameController,
                hint: 'Masukkan username',
              ),

              const SizedBox(height: 24),

              // EMAIL
              const Text(
                'Email',
                style: TextStyle(
                  color: Color(0xFF583410),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 8),

              _buildInputField(
                controller: _emailController,
                hint: 'Masukkan email',
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 24),

              // PASSWORD
              const Text(
                'Sandi',
                style: TextStyle(
                  color: Color(0xFF583410),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 8),

              _buildInputField(
                controller: _passwordController,
                hint: 'Masukkan sandi',
                obscureText: true,
              ),

              const SizedBox(height: 25),

              // BUTTON DAFTAR
              Container(
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.18),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: ElevatedButton(
                  onPressed: () {
                    Get.off(() => const MainPage());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5A3511),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),

                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // DIVIDER
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: const Color(0xFF583410).withValues(alpha: 0.25),
                      thickness: 1,
                      endIndent: 12,
                    ),
                  ),

                  Text(
                    'atau daftar dengan',
                    style: TextStyle(
                      color: const Color(0xFF583410).withValues(alpha: 0.6),
                      fontSize: 13,
                    ),
                  ),

                  Expanded(
                    child: Divider(
                      color: const Color(0xFF583410).withValues(alpha: 0.25),
                      thickness: 1,
                      indent: 12,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // SOCIAL ICON
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo_google.png',
                    width: 32,
                    height: 32,
                  ),
                  const SizedBox(width: 32),

                  Image.asset(
                    'assets/images/logo_twitter.png',
                    width: 32,
                    height: 32,
                  ),
                  const SizedBox(width: 32),

                  Image.asset(
                    'assets/images/logo_apple.png',
                    width: 32,
                    height: 32,
                  ),
                ],
              ),

              const SizedBox(height: 147),

              // LINK LOGIN
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah punya akun? ',
                    style: TextStyle(
                      color: const Color(0xFF583410).withValues(alpha: 0.7),
                      fontSize: 14,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Get.off(() => const LoginPage());
                    },
                    child: const Text(
                      'Masuk',
                      style: TextStyle(
                        color: Color(0xFF583410),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // INPUT FIELD BUILDER
  Widget _buildInputField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: const Color(0xFF583410).withValues(alpha: 0.28),
            fontSize: 14,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}