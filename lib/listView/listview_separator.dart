// -------------- LISTVIEW.SEPARATED --------------
// Dalam desain aplikasi modern, kejelasan adalah kunci. Menempelkan banyak teks tanpa pembatas sering kai membuat pengguna bingung . Anda bisa menggunakan LISTVIEW.SEPARATED untuk menambahkan garis pemisah otomatis.

// LISTVIEW.SEPARATED ini serupa dengan LISTVIEW.BUILDER. Jika pada BUILDER biasa Anda hanya memiliki instruksi untuk membuat isi baris, pada tipe SPARATED ini wajib menambhakan parameter ketiga, yaitu SEPARATORBUILDER. Fungsi ini bertugas layaknya asisten tambahan yang menaruh pembatas, seperti garis tipis, raung kosong (spasi), atau simbol tertentu, tepat di sela=sela item. Pembatas ini tidak diletakkan sebelum item pertama atau sesudah item terahir. Jadi, ini membuat tampilan daftar Anda jauh lebih profesional dan rapi karena setiap informasi memiliki pemisah yang konsisten tenpa harus menyisipkan secara manual di dalam logika baris utama.

import 'package:flutter/material.dart';

class SesiListviewSeparator extends StatelessWidget {
  const SesiListviewSeparator({super.key});

  final List<String> friendsName = const <String>['Budi', 'Andi', 'Caca'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 21,
        // 1. Membangun konten utama
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Berita Hari ini #$index'),
            leading: Icon(Icons.article),
          );
        },

        // 2. membangun pemisah di antara item (tapi tidak di paling atas/bawah).
        // separatorBuilder: (context, index) => Divider(
        //   height: 1,
        //   color: Colors.grey[300],
        //   indent: 50, // Memberikan jarak agar garis tidak menabrak ikon leading
        // ),

        // Misal: Menampilkan banner ads setiap 15 widget.::
        separatorBuilder: (context, index) {
          if ((index + 1) % 10 == 0) {
            return Container(
              height: 100,
              color: Colors.grey.shade200,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Center(
                child: Text(
                  'Iklan Ads Banner',
                  style: TextStyle(color: Colors.black38),
                ),
              ),
            );
          } else {
            return Divider(height: 1, color: Colors.grey[300], indent: 50);
          }
        },
      ),

      // :::::::::::: PENTING ::::::::::::
      // Bahwa SEPARATORBUILDER bukanlah sekedar alat untuk membuat garis horizontal atau DIVIER semata. Karena ia meruakan sebuah CALLBACK FUNCTION. Anda memiliki kemdali penuh untuk menyisipkan widget apapun sebagai pembatas, bahkan menyesuaikan jenis pembatasan tersebut berdasarkan posisi indeksnya.

      // Anda bisa mengekspolari kreatifitas dengan menyisipkan iklan setiap lima baris, memberikan spasi yang lebih lebar pada kategoru tertentu, atau bahkan mengubah warna pembatas pada urutan ganjil dan genap. Flesibilitas ini memungkinkan "conveyer" Anda tidak hanya berfungsi sebagai pengantar data, tetapi juga sebagai media penyaji konten yang dinamis dan interaktif, di mana setiap celah antar baris dapat memiliki fungsi dan estetika yang berbeda sesuai kebutuhan desain Anda.

      // HAL PENTING YANG PERLU DIPERHATIKAN
      // Sebagasi pemula, ada dua kondisi yang perlu Anda perhatikan agar aplikasi terlihat profesional.

      // 1. MENANGANI DAFTAR KOSONG:
      // Dalam membangun aplikasi yang dinamis, Anda harus selalu siap menghadapi kemungkinan di mana data yang diambil, misalnya dari internet, ternyata tidak menghasilkan apapun atau kosong. Alih-alih membiarkan penggua bingung menatap layar putih polos yang terkesan seperti aplikasi sedang error, Anda bisa menerapkan logika kondisional sederhana untuk memberikan umpan balik yang jelas.

      // Dengan memeriksa kondisi menggunakan isEmpty, Anda dapat mengalihkan tampilan dari LISTVIEW.BUILDER menjadi sebuah pesan informatif di tengah layar, seperti "Belum ada data teman." Pendekatan ini tidak hanya meningkatkan pengalaman pengguna (User Experience) karena memberikan kepastika nstatus aplikasi, tetapi juga menjaga estetika antarmuka agar tetap teradsa profesional dan terencana dengan baik.

      // if (friendsName.isEmpty) {
      //   return Center(child: Text("Belum ada data teman."));
      // } else {
      //   retunr ListView.builder(...)
      // }

      // 2. ARAH GULIR (SCROLL DIRECTION)
      // Secara bawaan, LISTVIEW memang dirancang secara vertikal. Namun, Anda memiliki kendali penuh untuk mengubah arah pengerakannya sesuai kebutuhan desian antarmuka. Dengan memanfaatkan properti SCROLLDIRECTION dan mengaturanya ke AXIS.HORIZONTAL, Anada secara instan mengubnah perilaku "CONVEYOR" dari yang semua turun ke bawah menjadi bergeser ke samping.

      // Fitur ini sangat krusial untuk menciptakan elemen modern seperti barisan stories media sosial katalog kartu produk, atau pilihan kategori yang sering kita temui di aplikasi populer. Hana dengan satu baris instruksi ini, tata letak widget Anda menjadi lebih fleksibel tanpa harus mengubah logika pembuatan data ynag sudah ada, memungkikan pemanfaatan ruang layar yang lebih kreatif bagi pengguna.

      // ListView.builder(
      //   scrollDirection: Axis.horizontal,
      //   itemBuilder:
      // (context, index) => MuCardWidget(),
      // );
    );
  }
}

// ListView, kunci utamanya bukan hanya sekadar bisa menampilkan data, melainkan cara Anda memilih alat yang tepat untuk kebutuhan yang tepat.

// JENIS LASTVIEW : Dasar
// KEGUNAAN       : Menu statis ,jumlah item sedikit (<15).
// KELEBIHAN      : Sangat simple digunakan.

// JENIS LASTVIEW : .builder
// KEGUNAAN       : Data dinamis (dari internet), jumlah banyak/tak terhingga.
// KELEBIHAN      : Sangat hemat memori dan cepat.

// JENIS LASTVIEW : .separated
// KEGUNAAN       : Daftar yang butuh garis pembatas rapi.
// KELEBIHAN      : Tampilan lebih terorganisasi.

// Sebenarnya, masih banyak hal yang perlu Anda eksplorasi. Tidak hanya ListView, ada GridView dan scrollable widget lainnya yang telah disediakan oleh Flutter.
