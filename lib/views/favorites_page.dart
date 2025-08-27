import 'package:flutter/material.dart';
import '../services/favorites_manager.dart';
import '../widgets/favorites_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = FavoritesManager.all;

    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: favorites.isEmpty
          ? const Center(child: Text("No favorites yet"))
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final destination = favorites[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: FavoriteCard(
              title: destination.title,
              imagePath: destination.imagePath,
            ),
          );
        },
      ),
    );
  }
}
