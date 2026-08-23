import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wisata_bandung/favorite/favorite_icon.dart';
import 'package:wisata_bandung/model/tourism_place.dart';

class DetailBodyForWide extends StatelessWidget {
  final TourismPlace tourismPlace;
  const DetailBodyForWide({super.key, required this.tourismPlace});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 8,
        crossAxisAlignment: .start,
        children: [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(size: 20, Icons.arrow_back_outlined),
                      ),
                      const SizedBox(width: 24),
                      Text(
                        'Detail Wisata',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FavoriteIcon(),
                      const SizedBox(width: 8),
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
                ],
              ),
            ),
          ),
          Row(
            crossAxisAlignment: .start,
            spacing: 8,
            children: [
              Expanded(
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      spacing: 12,
                      crossAxisAlignment: .start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(tourismPlace.imageHeader),
                        ),
                        SizedBox(
                          height: 100,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              spacing: 12,
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                for (final image in tourismPlace.imageUrls)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),

                                    child: Image.network(image),
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
              Expanded(
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: .start,
                      spacing: 20,
                      children: [
                        Text(
                          tourismPlace.name,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(thickness: 0.5, color: Color(0xFFD9D9D9)),
                        Row(
                          spacing: 12,
                          children: [
                            Icon(Icons.calendar_today_outlined, size: 20),
                            Text(
                              tourismPlace.openDays,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          spacing: 12,
                          children: [
                            Icon(Icons.access_time, size: 20),
                            Text(
                              tourismPlace.openTime,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          spacing: 12,
                          children: [
                            Icon(Icons.monetization_on_outlined, size: 20),
                            Text(
                              tourismPlace.ticketPrice,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const Divider(thickness: 0.5, color: Color(0xFFD9D9D9)),
                        Text(
                          tourismPlace.description,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
