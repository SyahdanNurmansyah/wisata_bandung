import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wisata_bandung/favorite/favorite_icon.dart';
import 'package:wisata_bandung/model/tourism_place.dart';
import 'package:wisata_bandung/screens/detail_body_for_mobile.dart';
import 'package:wisata_bandung/screens/detail_body_for_wide.dart';

class DetailScreenCodelab extends StatelessWidget {
  final TourismPlace tourismPlace;
  const DetailScreenCodelab({super.key, required this.tourismPlace});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 600;
    return Scaffold(
      appBar: isWide
          ? null
          : AppBar(
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.white,
              title: Text(
                'Detail Wisata',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_rounded),
              ),

              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    children: [
                      FavoriteIcon(),
                      IconButton(
                        onPressed: () {
                          final text =
                              'Lihat Wisata ini! ${tourismPlace.name} http://localhost:52450/${tourismPlace.name}';
                          SharePlus.instance.share(
                            ShareParams(text: text, subject: tourismPlace.name),
                          );
                        },
                        icon: Icon(Icons.turn_right_rounded),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final maxWidth = constraints.maxWidth;
              if (maxWidth <= 600) {
                return DetailBodyForMobile(tourismPlace: tourismPlace);
              } else {
                return Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 900),
                    child: DetailBodyForWide(tourismPlace: tourismPlace),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
