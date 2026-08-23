import 'package:flutter/material.dart';
import 'package:wisata_bandung/model/tourism_place.dart';
import 'package:wisata_bandung/screens/detail_screen_codelab.dart';

class TourismPlaceGrid extends StatelessWidget {
  const TourismPlaceGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: tourimsPlaceList.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 350,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final tourismPlace = tourimsPlaceList[index];
        return ToursimPlaceCardForGrid(
          tourismPlace: tourismPlace,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailScreenCodelab(tourismPlace: tourismPlace),
              ),
            );
          },
        );
      },
    );
  }
}

class ToursimPlaceCardForGrid extends StatelessWidget {
  final TourismPlace tourismPlace;
  final VoidCallback onTap;
  const ToursimPlaceCardForGrid({
    super.key,
    required this.tourismPlace,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    tourismPlace.imageHeader,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    tourismPlace.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    tourismPlace.location,
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
