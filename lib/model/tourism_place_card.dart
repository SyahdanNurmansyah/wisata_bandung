import 'package:flutter/material.dart';
import 'package:wisata_bandung/model/tourism_place.dart';

class TourismPlaceCard extends StatelessWidget {
  final TourismPlace tourismPlace;
  const TourismPlaceCard({super.key, required this.tourismPlace});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: .start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            tourismPlace.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            tourismPlace.location,
                            style: TextStyle(color: Colors.grey.shade600),
                          ),

                          Row(
                            spacing: 8,
                            crossAxisAlignment: .center,
                            children: [
                              Icon(
                                Icons.confirmation_number_rounded,
                                color: Colors.grey,
                                size: 20,
                              ),
                              Text(tourismPlace.ticketPrice),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
