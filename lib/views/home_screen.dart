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
          // 🌄 Sliver AppBar with image and overlay
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            backgroundColor: Theme.of(context).primaryColor,

            leading: IconButton(
              icon: const Icon(Icons.favorite),
              color: Theme.of(context).colorScheme.secondary, // Amber Glow
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FavoritesPage()),
                );
              },
            ),

            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                    child: Image.asset(
                      'assets/roberto-nickson-resort-medium.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor.withOpacity(0.6),
                          Colors.transparent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 🔘 Filter Chips
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Wrap(
                spacing: 10,
                children: [
                  _buildFilterChip(context, "Hiking"),
                  _buildFilterChip(context, "Kayaking"),
                  _buildFilterChip(context, "Biking"),
                ],
              ),
            ),
          ),

          // 🗺️ Destination Cards
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

      // 🟨 Book Now Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Book Now'),
        ),
      ),
    );
  }

  Widget _buildFilterChip(BuildContext context, String label) {
    return Chip(
      label: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
    );
  }
}
