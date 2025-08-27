import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const FavoriteCard({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: double.infinity,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.25),
            ),
            Positioned(
              left: 8.0,
              top: 40.0,
              child: Container(
                height: 58,
                width: 100,
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  title,
                  style: GoogleFonts.acme(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
