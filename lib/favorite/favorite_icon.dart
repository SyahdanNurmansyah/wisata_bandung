import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({super.key});

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },

      icon: Icon(
        isFavorite ? Icons.star_rounded : Icons.star_border_rounded,
        size: 28,
      ),
      color: isFavorite ? Colors.amber : Colors.grey.shade800,
    );
  }
}
