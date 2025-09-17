import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB6AEA3), // Nomad Beige
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome To',
                  style: GoogleFonts.poppins(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF242B38), // Ebony Clay
                  ),
                ),
                const SizedBox(height: 24),
                Image.asset(
                  'assets/logo_splash.png',
                  height: 200,
                ),
                const SizedBox(height: 12),
                Text(
                  'Your journey starts here',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color(0xFF242B38),
                  ),
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/signup'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB84D), // Amber Glow
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/signin'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF242B38),
                    side: const BorderSide(color: Color(0xFF242B38)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
