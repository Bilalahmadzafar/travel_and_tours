import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'sign_in_page.dart'; // Adjust path as needed

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showPassword = false;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

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
                  'Create Account',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF242B38), // Ebony Clay
                  ),
                ),
                const SizedBox(height: 32),
                _buildInputField(hint: 'Full Name'),
                const SizedBox(height: 16),
                _buildInputField(hint: 'Email'),
                const SizedBox(height: 16),
                _buildInputField(
                  hint: 'Password',
                  obscure: !showPassword,
                  controller: passwordController,
                ),
                const SizedBox(height: 16),
                _buildInputField(
                  hint: 'Confirm Password',
                  obscure: !showPassword,
                  controller: confirmController,
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
                    // Sign up logic will go here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB84D),
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
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    children: [
                      const TextSpan(text: 'Already have an account? '),
                      TextSpan(
                        text: 'Sign In',
                        style: const TextStyle(
                          color: Color(0xFFFFB84D),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String hint,
    bool obscure = false,
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF6F5F3), // Spring Wood
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
