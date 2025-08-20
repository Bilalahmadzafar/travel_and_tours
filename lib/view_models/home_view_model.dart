import '../models/destination_model.dart';

class HomeViewModel {
  final List<Destination> destinations = [
    Destination(
      title: 'Emerald Pass',
      country: 'Switzerland',
      imagePath: 'assets/emerald pass_mountain.jpg', // Add image path later
    ),
    Destination(
      title: 'Summit Serenity',
      country: 'Canada',
      imagePath: 'assets/summit_serenity2.jpg', // Add image path later
    ),
    Destination(
      title: 'Lake Retreat',
      country: 'New Zealand',
      imagePath: 'assets/lake.jpg', // Add image path later
    ),
    Destination(
      title: 'Ocean Drive',
      country: 'Italy',
      imagePath: 'assets/ocean drive.jpg', // Add image path later
    ),
    Destination(
      title: 'Mountain Trail',
      country: 'Austria',
      imagePath: 'assets/summit_serenity.jpg', // Add image path later
    ),
    Destination(
      title: 'Sunset Ridge',
      country: 'Japan',
      imagePath: 'assets/sunset_ridge.jpg', // Add image path later
    ),
  ];
}
