import '../models/destination_model.dart';

class HomeViewModel {
  final List<Destination> destinations = [
    Destination(
      title: 'Emerald Pass',
      country: 'Switzerland',
      imagePath: 'assets/emerald pass_mountain.jpg', // Add image path later
      description:
          'Emerald Pass in Switzerland is a dream for nature‑loving, travelers—lush green meadows, '
              'shimmering alpine lakes, and snow‑dusted peaks create postcard views at every turn. '
              'Perfect for hiking, photography, and soaking in the crisp mountain air, '
              'it’s a peaceful escape that captures the true magic of the Swiss Alps.',
    ),
    Destination(
      title: 'Summit Serenity',
      country: 'Canada',
      imagePath: 'assets/summit_serenity2.jpg', // Add image path later
      description: 'Summit Serenity in Canada is a tranquil mountain escape where sweeping alpine vistas meet crisp, '
          'refreshing air. Surrounded by towering evergreens and glistening snow for much of the year,'
          ' it’s a haven for hikers, photographers, and anyone seeking peace above the clouds. '
          'Whether you’re tracing scenic trails in summer or gazing over a silent, snowy wilderness in winter,'
          ' Summit Serenity lives up to its name — offering moments that linger long after you’ve descended.',
    ),
    Destination(
      title: 'Lake Retreat',
      country: 'New Zealand',
      imagePath: 'assets/lake.jpg', // Add image path later
      description: 'Lake Retreat in NewZealand is a peaceful hideaway where glass‑clear waters reflect rolling green hills and snow‑tipped peaks. Perfect for kayaking, lakeside picnics, and sunset walks, it offers travelers a chance to slow down, breathe in the crisp air, and soak up the pure, unspoiled beauty of the Kiwi outdoors.',
    ),
    Destination(
      title: 'Ocean Drive',
      country: 'Italy',
      imagePath: 'assets/ocean drive.jpg', // Add image path later
      description: 'Ocean Drive in Italy is a stunning coastal route where shimmering turquoise waters meet sun‑kissed cliffs and charming seaside villages. Travelers can enjoy scenic drives, fresh seafood at waterfront cafés, and strolls along promenades with breathtaking Mediterranean views — a perfect blend of relaxation, culture, and coastal beauty.',
    ),
    Destination(
      title: 'Mountain Trail',
      country: 'Austria',
      imagePath: 'assets/summit_serenity.jpg', // Add image path later
      description: 'Mountain Trail in Austria winds through breathtaking alpine scenery, where rugged peaks tower over lush valleys and crystal‑clear streams. Perfect for hikers and nature lovers, it offers panoramic views, fresh mountain air, and an authentic taste of the Austrian outdoors.',
    ),
    Destination(
      title: 'Sunset Ridge',
      country: 'Japan',
      imagePath: 'assets/sunset_ridge.jpg', // Add image path later
      description: 'Sunset Ridge in Japan offers sweeping mountain vistas that glow in shades of gold, pink, and amber as the day ends. Perched above tranquil valleys and framed by distant peaks, it’s a peaceful spot for evening hikes, photography, or simply pausing to take in the serene beauty of a Japanese sunset.',
    ),
  ];
}
