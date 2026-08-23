import 'package:flutter/material.dart';
import 'package:wisata_bandung/model/tourism_place.dart';
import 'package:wisata_bandung/model/tourism_place_card.dart';
import 'package:wisata_bandung/screens/detail_screen_codelab.dart';

class TourismPlaceList extends StatelessWidget {
  const TourismPlaceList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Ubah Text menjadi wdiget ListView.builder
      itemCount: tourimsPlaceList.length,
      itemBuilder: (context, index) {
        final tourismPlace = tourimsPlaceList[index];
        return TourismPlaceCard(
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
