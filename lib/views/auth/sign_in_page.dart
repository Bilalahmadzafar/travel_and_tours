import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_up_page.dart'; // Make sure this path matches your structure

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool showPassword = false;

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
                  'Welcome Back',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF242B38), // Ebony Clay
                  ),
                ),
                const SizedBox(height: 32),

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
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 30),

                TextField(
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: const Color(0xFFF6F5F3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                Row(
                  children: [
                    Checkbox(
                      value: showPassword,
                      onChanged: (value) {
                        setState(() {
                          showPassword = value!;
                        });
                      },
                      activeColor: const Color(0xFFFFB84D), // Amber Glow
                    ),
                    const Text(
                      'Show Password',
                      style: TextStyle(color: Color(0xFF242B38)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                ElevatedButton(
                  onPressed: () {
                    // Sign in logic will go here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB84D),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    // Navigate to ForgotPasswordPage
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color(0xFF242B38)),
                  ),
                ),

                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Don’t have an account? Sign Up',
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
