class Destination {
  final String title;
  final String country;
  final String imagePath;
  final String? description;

  Destination({
    required this.title,
    required this.country,
    required this.imagePath,
    this.description,
  });
}
