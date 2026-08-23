//  LAYOUT BUILDER
// Sekarang, bayangkan di dalam ruangan besar itu sudah ada lemari panjang. Anda diminta melektakkan sebuah hiasan di rak lemari tersebut. Anda tidak lagi peduli seberapa luas ruangan 5 meter tadi. Anda hanya peduli: "Berapa lebar rak lemari ini?" jika raknya sempit, Anda menaruh satu vas kecil. Jika raknyna luas, Anda menaruh deretan buku, Anda mengambil keputusan berdasarkan ruang yang tersisa di tempat widget itu berada.

// Itulah sifat LayoutBuilder. Ia adalah widget yang sangat "rendah hati". ia tidak melihat ke langit (layar), ia hanya melihat ke "orang tuanya" (parent widget). Ia sangat beguna untnuk membuat komponen yang bisa digunakan kembali (reusable components).

// Mengapa LayoutBuilder penting? Sering kali, sebuah widget diletakkan di dalam Row, Column, atau Container yang sudah memiliki uuran tertentu. Jika Anada menggunakan MediaQuery, widget tersebut mungkin akan mencoba mengambil ukuran layar penuh dan akhirnya menyebabkan error overflow. LayoutBuilder mencegah hal in idengan memberikan batasan (contraints) yang pasti.

// Dalam penggunaa LayoutBuilder, ada objek contrainst yang menajdi kunci utama untuk memahami ruang yang diberikan oleh widget induk kepada widget anaknya. Berikut adalahg empat properti utama yang terkandung di dalamnnya.

// 1. minWidth & maxwidth: Menentukan ambang batas lebar batas minimum dan maksimum yang diizinkan untuk diisi oleh child widget.

// 2. minHeight & maxHeightL: Menentukan ambang bayas tnggi minimum dan maksimum yang bisa ditempati oleh child widget di dalam tata letak tersebut.

// LayoutBuilder(
//   builder: (BuildCOntext context, BoxConstraints) {
//     double maxwidth = constraints.maxwidth;
//     double maxHeight = constraints.maxHeight;
//     double minwidth = constraints.maxwidth;
//     double minHeigt = constraints.maxHeight;

//     retunr ChildWidget()
//   }
// )

import 'package:flutter/material.dart';

class SesiTanpaLayoutBuilder extends StatelessWidget {
  const SesiTanpaLayoutBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: ColoredBox(
              color: Colors.blueGrey,
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .stretch,
                children: [
                  Text(
                    'MediaQuery: 0.00',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'LayoutBuilder: 0.00',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ColoredBox(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .stretch,
                children: [
                  Text(
                    'MediaQuery: 0.00',
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'LayoutBuilder: 0.00',
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SesiLayoutBuilder extends StatelessWidget {
  const SesiLayoutBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final screenWidth = size.width;

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final constraintsWidth = constraints.maxWidth.toStringAsFixed(
                  0,
                );
                return ColoredBox(
                  color: Colors.blueGrey,
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .stretch,
                    children: [
                      Text(
                        'MediaQuery: $screenWidth',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Constraints: $constraintsWidth',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Expanded(
            flex: 3,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final constraintsWidth = constraints.maxWidth.toStringAsFixed(
                  0,
                );
                return ColoredBox(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .stretch,
                    children: [
                      Text(
                        'MediaQuery: $screenWidth',
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'LayoutBuilder: $constraintsWidth',
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Bagian Teks "MediaQuery" akan diberi data MediaQueryData.size.width, sedangkan bagian teks "LayoutBuilder" akan diberi data Constraints.maxWidth.
// Perbedaan nilai ini muncul karena MediaQuery secara global, sementara LayoutBuilder melaporkan kapasitas ruang aktual yang diberikan oleh widget induknya secara lokal.

// Angka pada MediaQuery ini merepresentasikan lebar penuh jendela aplikas dari ujung kiri ke ujung kanan. Tidak peduli di mana ia diletakkan, MediaQuery akan selalu memberikan angka yang sama keran ia merujuk pada "ukuran kanvas" besae sistem operasi.

// Sedangkan, angka LayoutBulder bersifat spesifik pada aera di mana ia berada, dalam hal ini adalah ColoredBox. Pada bagian drawer, ia hanya mendeteksi lebar 358 piksel, sedangkan pada aera konten utama, ia mendeteksi 1073 piksel. LAyoutBuilder sangant berguna jika Anda ingin membuat komponen yang adaprif terhadap sisa ruang yang tersedia, bukan terhadap ukuran layar ponsel secara keseluruhan.
