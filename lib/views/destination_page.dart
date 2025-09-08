import 'package:flutter/material.dart';
import '../models/destination_model.dart';
import '../services/favorites_manager.dart';

class DestinationPage extends StatefulWidget {
  final Destination destination;

  const DestinationPage({
    super.key,
    required this.destination,
  });

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage>
    with TickerProviderStateMixin {
  late final AnimationController _imageController;
  late final AnimationController _textController;
  late final Animation<Offset> _imageOffset;
  late final Animation<Offset> _textOffset;
  late final Animation<double> _imageOpacity;
  late final Animation<double> _textOpacity;
  bool isFavorited = false;

  @override
  void initState() {
    super.initState();
    isFavorited = FavoritesManager.all.contains(widget.destination);

    _imageController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _imageOffset = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _imageController, curve: Curves.easeOut),
    );

    _textOffset = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeOut),
    );

    _imageOpacity = CurvedAnimation(
      parent: _imageController,
      curve: Curves.easeOut,
    );

    _textOpacity = CurvedAnimation(
      parent: _textController,
      curve: Curves.easeOut,
    );

    _imageController.forward();
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) _textController.forward();
    });
  }

  @override
  void dispose() {
    _imageController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final destination = widget.destination;

    return Scaffold(
      appBar: AppBar(
        title: Text(destination.title),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F5F3), // 🌿 Spring Wood
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                SlideTransition(
                  position: _imageOffset,
                  child: FadeTransition(
                    opacity: _imageOpacity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        destination.imagePath,
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SlideTransition(
                  position: _textOffset,
                  child: FadeTransition(
                    opacity: _textOpacity,
                    child: Text(
                      destination.description ?? "No description yet...",
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Color(0xFF242B38), // 🖤 Ebony Clay
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () {
                    if (!isFavorited) {
                      FavoritesManager.add(widget.destination);
                      setState(() {
                        isFavorited = true;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${widget.destination.title} added to favorites'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  icon: Icon(
                    isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white,
                  ),
                  label: Text(
                    isFavorited ? 'Added to Favorites' : 'Add to Favorites',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isFavorited
                        ? const Color(0xFF3A8FB7) // 💙 Celestial Blue
                        : const Color(0xFFFFB84D), // 🧡 Amber Glow
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
