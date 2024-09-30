import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final String imageAsset;
  final Color outerColor; // New parameter for outer color

  const CategoryCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.imageAsset,
    this.outerColor = Colors.blue, // Default color if not provided
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: outerColor.withOpacity(0.2), // Outer color with opacity
              ),
              child: Icon(
                icon,
                size: 40,
                color: outerColor, // Icon color
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
