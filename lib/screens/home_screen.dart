import 'package:flutter/material.dart';
import 'package:wisata_bandung/model/tourism_place.dart';
import 'package:wisata_bandung/model/tourism_place_card.dart';
import 'package:wisata_bandung/screens/detail_screen_codelab.dart'; // tambahkan import untuk akses TourismPlace

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Wisata Bandung',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        leading: Icon(Icons.forest),
      ),

      body: SafeArea(
        child: ListView.builder(
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
        ),
      ),
    );
  }
}
