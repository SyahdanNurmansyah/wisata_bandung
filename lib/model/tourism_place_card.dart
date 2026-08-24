import 'package:flutter/material.dart';
import 'package:wisata_bandung/model/tourism_place.dart';

class TourismPlaceCard extends StatelessWidget {
  final TourismPlace tourismPlace;
  final VoidCallback onTap;
  const TourismPlaceCard({
    super.key,
    required this.tourismPlace,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.white,
        clipBehavior: Clip.hardEdge,

        child: InkWell(
          onTap: onTap,
          splashColor: Colors.grey.shade50,
          highlightColor: Colors.grey.shade100,
          child: Row(
            spacing: 16,
            crossAxisAlignment: .start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    tourismPlace.imageHeader,
                    height: 100,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, right: 12),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        tourismPlace.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),

                      Text(
                        tourismPlace.location,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
