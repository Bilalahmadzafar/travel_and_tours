import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB6AEA3), // Nomad

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Reset Password',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF242B38), // Ebony Clay
                  ),
                ),
                const SizedBox(height: 32),

                Text(
                  'Enter your email and we’ll send you a link to reset your password.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xFF242B38),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),

                TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: const Color(0xFFF6F5F3), // Spring Wood
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: () {
                    // Firebase password reset logic will go here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB84D), // Amber Glow
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Send Reset Link',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to Sign In
                  },
                  child: const Text(
                    'Back to Sign In',
                    style: TextStyle(color: Color(0xFF242B38)),
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
