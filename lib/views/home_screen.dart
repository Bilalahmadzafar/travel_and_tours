import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../view_models/home_view_model.dart';
import '../widgets/destination_card.dart';
import 'favorites_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = HomeViewModel();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 🌄 Sliver AppBar with background image
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            backgroundColor: Colors.transparent,

            leading: IconButton(
              icon: const Icon(Icons.favorite, color: Colors.yellow, size: 28),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FavoritesPage()),
                );
              },
            ),

            flexibleSpace: FlexibleSpaceBar(
              // title: const Text('Select Destination'),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.asset(
                  'assets/roberto-nickson-resort-medium.jpg', // <- Scenic image
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // 🔘 Filter chips
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              child: Wrap(
                spacing: 10,
                children: [
                  _buildFilterChip("Hiking"),
                  _buildFilterChip("Kayaking"),
                  _buildFilterChip("Biking"),
                ],
              ),
            ),
          ),

          // 🗺️ Destination cards from ViewModel
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return DestinationCard(
                    destination: viewModel.destinations[index],
                  );
                },
                childCount: viewModel.destinations.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
            ),
          ),
        ],
      ),

      // 🟩 Book Now button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: const Color(0xFFBFD75A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Book Now',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Chip(
      backgroundColor: const Color(0xFFE6F0C8),
      label: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 14),
      ),
    );
  }
}
