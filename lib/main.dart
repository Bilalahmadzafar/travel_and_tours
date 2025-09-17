import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_and_tours/views/home_screen.dart';
import 'package:travel_and_tours/views/auth/sign_in_page.dart';
import 'package:travel_and_tours/views/auth/sign_up_page.dart';
import 'package:travel_and_tours/views/auth/forgot_password_page.dart';
import 'package:travel_and_tours/views/welcome_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: '/welcome',

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF3A8FB7),
        scaffoldBackgroundColor: const Color(0xFFB6AEA3),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3A8FB7),
          foregroundColor: Color(0xFFF6F5F3),
          elevation: 0,
        ),
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          bodyMedium: const TextStyle(color: Color(0xFF242B38)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFB84D),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        chipTheme: const ChipThemeData(
          backgroundColor: Color(0xFFD3E3E3),
          labelStyle: TextStyle(color: Color(0xFF242B38)),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
      ),


      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/home': (context) => const HomeScreen(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/forgot-password': (context) => const ForgotPasswordPage(),
      },
    );
  }
}
