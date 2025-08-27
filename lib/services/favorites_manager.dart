import '../models/destination_model.dart';

class FavoritesManager {
  static final List<Destination> _favorites = [];

  static void add(Destination destination) {
    if (!_favorites.contains(destination)) {
      _favorites.add(destination);
    }
  }

  static List<Destination> get all => _favorites;
}
