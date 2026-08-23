import 'package:flutter/material.dart';
import 'package:wisata_bandung/model/tourism_place.dart';

class DetailBodyForMobile extends StatelessWidget {
  const DetailBodyForMobile({super.key, required this.tourismPlace});

  final TourismPlace tourismPlace;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(tourismPlace.imageHeader),

                  // PENTING MENDAFTAR ASET GAMBAR LOKAL
                  // Menambahkan aset gambar lokal ke dalam proyek Flutter sangat krusial karena Flutter menganut sistem SANDBOXING. Hal ini ditujukan dengan alasan keamanan dan efisiensi performa. Dengan mendaftarkan gambar ke dalam berkas pubspec.yaml. Anda secara eskplisit memberikan izin kepada aplikasi untuk membundel berkas fisik tersebut ke dalam paket instalasi (APK atau IPA) saat proses build berlangsung.
                ),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    tourismPlace.name,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(
                spacing: 8,
                mainAxisAlignment: .center,
                // crossAxisAlignment: .center,
                children: [
                  Expanded(
                    child: Column(
                      spacing: 8,
                      children: [
                        Icon(Icons.calendar_today_outlined, size: 18),
                        Text(
                          tourismPlace.openDays,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 8,
                      children: [
                        Icon(Icons.access_time, size: 18),
                        Text(
                          tourismPlace.openTime,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 8,
                      children: [
                        Icon(Icons.monetization_on_outlined, size: 18),
                        Text(
                          tourismPlace.ticketPrice,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            spacing: 16,
            children: [
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  tourismPlace.description,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(
                height: 150,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,

                  // MENGATASI MASALAH TAMPILAN DENGAN SCROLLVIEW
                  // Masalah BOTTOM OVERFLOWED sering terjadi saat kita menggunakan widget COLUMN. Hal ini terjadi kerena secara bawaan widget ini mencoba memuat seluruh kontennya dalam ruang vertikal yang terbatas tanpa kemampuan untuk bergeser.

                  // Dengan menggunakan SINGLECHILDSCROLLVIEW bisa membuat widget COLUMN bisa scrollable tana terhalang batasan lagi.

                  // Namun, mengunakan SINGLECHILDSCROLLVIEW ibarat menjalankan conveyor yang memaksakan seluruh kotak barang diletakkan di atas sabuknya secara bersamaan sejak detik pertama. Meskipun cara ini berhasil membuat halaman bisa digulir, sistem akan dipaksa untuk me-render dan memproses semua data di dalam COLUMN sekaligus, tidak peduli apakah data tersebut sedang terlihat di layar atau masih terkubur jawh di sana. Akibatnya, jika Anda memiliki ribuan data, beban kerja pernagkat akan melonjak drastis dan berisiko menyebabkan aplikasi terasa berat atau "patah-patah" karena keterbatasan memori.

                  // Di sinilah letak perbedaan krusialnya. Tidak seperti LISTVIEW yang hanya memproses barang saat melewati layar, SINGLECHILDSCROLLVIEW kuruang efisien untuk menangani daftar data yang dinamis atau berjumlah besar karena ia tidak memiliki kemampuan manajemen memori otomatis. Maka dari itu, LISTVIEW diciptakan untuk mencegah jal inii dengan memberikan kemampuan SCROLL yang adaptif.
                  child: Row(
                    spacing: 8,
                    children: [
                      for (final image in tourismPlace.imageUrls)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(image),
                        ),
                    ],
                  ),
                ),
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  elevation: 0,
                  foregroundColor: Colors.blue.shade100,
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: SizedBox(
                          width: 400,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text(
                                'Hello World! Selamat Anda berhasil uji coba tombol ini!',
                                style: TextStyle(fontSize: 18),
                              ),

                              Row(
                                spacing: 16,
                                mainAxisAlignment: .end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Keluar'),
                                  ),
                                  FilledButton(
                                    style: FilledButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text('Lanjut'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  spacing: 12,
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      'Lihat detail',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 18.0,
                      ),
                    ),

                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),
                  ],
                ),
              ),
              // Row(
              //   spacing: 12,
              //   children: [
              //     Expanded(
              //       child: FilledButton(
              //         style: FilledButton.styleFrom(
              //           elevation: 0,
              //           foregroundColor: Colors.blue.shade100,
              //           padding: const EdgeInsets.all(16),
              //           backgroundColor: Colors.orangeAccent,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(12),
              //           ),
              //         ),
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => SesiListView(),
              //             ),
              //           );
              //         },

              //         child: Text(
              //           'ListView Standar\nUntuk 5-10 Baris Data',
              //           style: TextStyle(color: Colors.black),
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: FilledButton(
              //         style: FilledButton.styleFrom(
              //           elevation: 0,
              //           foregroundColor: Colors.blue.shade100,
              //           padding: const EdgeInsets.all(16),
              //           backgroundColor: Colors.lightGreenAccent,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(12),
              //           ),
              //         ),
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => SesiListViewBuilder(),
              //             ),
              //           );
              //         },

              //         child: Text(
              //           'ListView Builder\nBest Practice untuk banyak data',
              //           style: TextStyle(color: Colors.black),
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: FilledButton(
              //         style: FilledButton.styleFrom(
              //           elevation: 0,
              //           foregroundColor: Colors.blue.shade100,
              //           padding: const EdgeInsets.all(16),
              //           backgroundColor: Colors.lightGreenAccent,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(12),
              //           ),
              //         ),
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => SesiListviewSeparator(),
              //             ),
              //           );
              //         },

              //         child: Text(
              //           'ListView Separator',
              //           style: TextStyle(color: Colors.black),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
        // const SizedBox(height: 24),
        // FilledButton(
        //   style: FilledButton.styleFrom(
        //     elevation: 0,
        //     foregroundColor: Colors.blue.shade100,
        //     padding: const EdgeInsets.all(16),
        //     backgroundColor: Colors.lightGreenAccent,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(12),
        //     ),
        //   ),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => SesiNavigation()),
        //     );
        //   },

        //   child: Text(
        //     'ListView Separator',
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),
        // const SizedBox(height: 24),
        // FilledButton(
        //   style: FilledButton.styleFrom(
        //     elevation: 0,
        //     foregroundColor: Colors.blue.shade100,
        //     padding: const EdgeInsets.all(16),
        //     backgroundColor: Colors.lightGreenAccent,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(12),
        //     ),
        //   ),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => SesiMediaQuery()),
        //     );
        //   },

        //   child: Text(
        //     'Sesi MediaQuery',
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),
        // const SizedBox(height: 24),
        // FilledButton(
        //   style: FilledButton.styleFrom(
        //     elevation: 0,
        //     foregroundColor: Colors.blue.shade100,
        //     padding: const EdgeInsets.all(16),
        //     backgroundColor: Colors.lightGreenAccent,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(12),
        //     ),
        //   ),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => SesiTanpaLayoutBuilder(),
        //       ),
        //     );
        //   },

        //   child: Text(
        //     'Sesi Tanpa LayoutBuilder',
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),
        // const SizedBox(height: 24),
        // FilledButton(
        //   style: FilledButton.styleFrom(
        //     elevation: 0,
        //     foregroundColor: Colors.blue.shade100,
        //     padding: const EdgeInsets.all(16),
        //     backgroundColor: Colors.lightGreenAccent,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(12),
        //     ),
        //   ),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => SesiLayoutBuilder(),
        //       ),
        //     );
        //   },

        //   child: Text(
        //     'Sesi LayoutBuilder',
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),
      ],
    );
  }
}
