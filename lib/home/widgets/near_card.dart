import 'package:flutter/material.dart';

class NearCard extends StatelessWidget {
  final String title, address, distance, image;

  const NearCard({
    super.key,
    required this.title,
    required this.address,
    required this.distance,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Image.asset(image, width: double.infinity, fit: BoxFit.cover),
            Container(
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter,
              //   ),
              // ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    address,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                // decoration: BoxDecoration(
                //   color: Colors.black.withOpacity(0.5),
                //   borderRadius: BorderRadius.circular(12),
                // ),
                child: Row(
                  children: [
                    // const Icon(
                    //   Icons.location_on,
                    //   color: Colors.white,
                    //   size: 12,
                    // ),
                    const SizedBox(width: 4),
                    Text(
                      distance,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
