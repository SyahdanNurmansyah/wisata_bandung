import 'package:flutter/material.dart';
import 'package:wisata_bandung/model/tourism_place_grid.dart';
import 'package:wisata_bandung/model/tourism_place_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 600;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: isWide
            ? Row(
                mainAxisAlignment: .center,
                spacing: 24,
                children: [
                  Icon(Icons.forest),
                  Text(
                    'Wisata Bandung',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            : Text(
                'Wisata Bandung',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

        leading: isWide ? null : Icon(Icons.forest),
      ),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= 600) {
              return TourismPlaceList();
            } else {
              return Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 900),
                  child: TourismPlaceGrid(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
