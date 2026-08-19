// -------------------------- IMAGE --------------------------
// Aplikasi tanpa image seperti air laut tanpa garam.

// PROPERTI IMAGE
// Image.network: Mengambil gambar dari Internet
// Ini adalaj cara yang paling instan dan sering dignakan untuk aplikasi yang datanya berubah-ubah seara dinamis. Ada hanya perlu memberikan "alamat" atau URL gambar tersebut, dan Flutter akan otomatis mengunduh serta menampilkannya.

// Sama seperti menonton video straming. Anda tidak memiliki file videonya di HP, tetapi Anda punya link untuk menontonnya secara langsung selama ada koneksi internet. Begini kodenya:

import 'package:flutter/material.dart';

class SesiImage extends StatefulWidget {
  const SesiImage({super.key});

  @override
  State<SesiImage> createState() => _SesiImageState();
}

class _SesiImageState extends State<SesiImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.network(
        'https://picsum.photos/300/150',
        // width: 350,
        // height: 250,
        fit: BoxFit.cover,

        // 1. BOXFIT.COVER: Gambar akan memenuhi seluruh ruang bingkai yang tersedia (gambar akan terpotong jika tidak sesuai rasio).
        // 2. BOXFIT.CONTAIN: Gambar akan ditampilkan selengkap mungkin di dalam bingkai tanpa terpotong dan tertransform.
        // 3. BOXFIT.FILL: Memaksa gambar untuk mengisi penuh seluruh area bingkai.
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              // valueColor: AlwaysStoppedAnimation(Colors.amber),
              // strokeWidth: 2,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 150,
            color: Colors.white,
            child: Column(
              spacing: 16,
              mainAxisAlignment: .center,
              children: [
                Icon(Icons.error, color: Colors.grey.shade200, size: 60),
                Text(
                  'Gagal memuat gambar',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade400),
                ),
              ],
            ),
          );
        },

        // Dalam pengembangan aplikas nyata, aspek pengalaman pengguna (user experience) sangat bergantung pada bagaimana aplikasi meresponse ketidakpastian koneksi internet. Flutter memfasilitasi hal ini melalui fitur LOADINGBUILDER dan ERRORBUILDER, yang berfungsi sebagai mekanisme pertahanan agar antarmuka tidak terlihat "rusak" saat terjadi kendala teknis.

        // 1. LOADINGBUILDER: Digunakan untuk memantau progres pengunduhan data secara real-time.
        // 2. ERRORBUILDER: Digunakan untuk menangkap interupsi atau kegagalan askes URL.
      ),
    );
  }
}

// PERBEDAAN IMAGE.NEtWORK DENGAN IMAGE.AsSETS
// Meskipun ada kemuiripan struktur, perbedaan mendasar pada mekanisme pemuatannya yang memengaruhi ketersediaan fitur pendukungnya. Karena seluruh aset ambar telah dikompresi dan dikemas langsung ke dalam instalasi alikasi saat proses build, siste.m dapat mengakses data tersebut secara lokal dalam hitungan milidetik tanpa bergantung pada latensi jaringan.

// Hal inilah yang menyebabkan properti LOADINGBUILDER tidak tersedia pada IMAGE.ASSET karena memang tidak ada jeda waktu mengunduh yang perlu divisualisaikan kepada pengguna. Namun Flutter tetap mneyediakan properti ERRORBUILDER sebagai langkah preventif.
