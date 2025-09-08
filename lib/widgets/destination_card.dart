import 'package:flutter/material.dart';
import 'package:travel_and_tours/views/destination_page.dart';
import '../models/destination_model.dart';

class DestinationCard extends StatelessWidget {
  final Destination destination;

  const DestinationCard({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DestinationPage(destination: destination),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                destination.imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Container(
              width: double.infinity,
              color: const Color(0xD73A8FB7), // 💙 Celestial Blue background
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    destination.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFFF6F5F3), // 🌿 Spring Wood for contrast
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    destination.country,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFFFB84D), // 🧡 Amber Glow accent
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
