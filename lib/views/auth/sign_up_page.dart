import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import '../../services/auth_service.dart';
import 'sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showPassword = false;
  bool loading = false;
  String? errorMessage;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  final AuthService _authService = AuthService();

  void _handleSignUp() async {
    setState(() {
      loading = true;
      errorMessage = null;
    });

    final fullName = fullNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirm = confirmController.text.trim();

    if (fullName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirm.isEmpty) {
      setState(() {
        errorMessage = 'Please fill in all fields.';
        loading = false;
      });
      return;
    }

    if (password != confirm) {
      setState(() {
        errorMessage = 'Passwords do not match.';
        loading = false;
      });
      return;
    }

    try {
      final user = await _authService.signUp(email, password);
      if (user != null) {
        // Save full name in Firebase profile
        await _authService.updateDisplayName(fullName);

        // Navigate to home screen
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      setState(
          () => errorMessage = e.toString().replaceFirst('Exception: ', ''));
    } finally {
      setState(() => loading = false);
    }
  }

  void _handleGoogleSignIn() async {
    setState(() {
      loading = true;
      errorMessage = null;
    });

    try {
      final user = await _authService.signInWithGoogle();
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      setState(() => errorMessage = e.toString());
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB6AEA3),
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
                    color: const Color(0xFF242B38),
                  ),
                ),
                const SizedBox(height: 32),
                _buildInputField(
                    hint: 'Full Name', controller: fullNameController),
                const SizedBox(height: 16),
                _buildInputField(hint: 'Email', controller: emailController),
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
                      activeColor: const Color(0xFFFFB84D),
                    ),
                    const Text(
                      'Show Password',
                      style: TextStyle(color: Color(0xFF242B38)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (errorMessage != null)
                  Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                const SizedBox(height: 12),

                // Sign Up Button
                loading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _handleSignUp,
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
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),

                const SizedBox(height: 20),

                // Google Sign In Button
                OutlinedButton.icon(
                  onPressed: _handleGoogleSignIn,
                  icon: Image.asset(
                    'assets/google_logo.png',
                    height: 50,
                    width: 50,
                  ),
                  label: const Text("Sign Up with Google"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.black26),
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Switch to Sign In
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 14, color: Colors.black),
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
        fillColor: const Color(0xFFF6F5F3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
