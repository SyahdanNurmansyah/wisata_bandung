import 'package:flutter/material.dart';
import 'package:wisata_bandung/model/tourism_place.dart';
import 'package:wisata_bandung/model/tourism_place_card.dart'; // tambahkan import untuk akses TourismPlace

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const Text('Wisata Bandung'),

        leading: Icon(Icons.menu),
      ),

      body: SafeArea(
        child: ListView.builder(
          // Ubah Text menjadi wdiget ListView.builder
          itemCount: tourimsPlaceList.length,
          itemBuilder: (context, index) {
            final tourismPlace = tourimsPlaceList[index];
            return TourismPlaceCard(tourismPlace: tourismPlace);
          },
        ),
      ),
    );
  }
}
