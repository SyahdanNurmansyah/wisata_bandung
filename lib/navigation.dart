// -------------- KONSEP DASAR NAVIGASI --------------

// Bayangkan aplikasi Anda sebuah tumpukan kartu fisik yang diletakkan di atas meja kerja Anda. Dalam ilmu komputer, sistem tumpukan ini dikenal dengan istilah STACK.

// NAVIGATOR bekerja dengan prinsip Last In, First Out (Yang Terakhir Masuk, Yang Pertama Keluar). Dalam sistem ini, setiap halaman baru yang dibuka akan diletakan di posisi paling atas, menutupi halaman sebelumnya. Akibatnya, halaman yang sedang aktif dan berinteraksi langsung dengan pengguna selalu merupakan "kartu" yan berada di urutan teratas tumpukan tersebut. Ketika pengguna menekan tombol kembali, kartu paling atas akan disingkirkan sehingga halaman yang berada tepat di bawahnya kemabli muncul ke permukaan.

// Keunggulan sistem stack ini adalah "ingatan"-nya. Kartu-kartu di bawahnya tidak dihapus. Mereka tetap ada di sana dalam keaadaan "diam" atau paused, meunggu giliran untuk muncul kembali kartu di atasnya dibuang. Inilah alaasan mengapa saat Anda menekan tombol Back, aplikas tahu peresi ke mana harus kemabli tanpa Anda perlu memprogram ulang rutenya.

// NAVIGATOR.PUSH
// Perintah PUSH berperan sebagai instruksi untuk menambah satu "lapisan" halaman baru tepat di atas tumpukan layar yang sedang terbuka. Analoginya seperti meletakkan selembar kertas baru di atas tumpukan dokumen.

// Halaman lama tidak hilang, melaikan hanya tertutup oleh halaman baru yang kini menjadi fokus utama interaksi pengguna. Dengan menggunakan perintah ini, Anda membangun alur navigasi yang mendalam, memungkinkan pengguna untuk melangkah maju ke informasi detail tanpa memutus konteks dari halaman sebelumnya.

// Untuk menfeksekysu oerubta PUSH, Anda memerlukan dua konounen krusial yang salung melengjkapi: CONTEXT dan ROUTE.

// 1. CONTEXT berfungsi sebagai identitas atau koordinat posisi sebuah widget di daam struktur besar aplikasi. Tanpa informasi ini, NAVIGATOR akan kehilangan arah dan tidak tahu di tumpukan mana ia harus menambahkan halaman baru.

// ROUTE berperan sebagai peta jalan atau cetak biru, di mana dalam ekosstem Flutter kita umumnya menggunakan MATERIALPAGEROUTE untuk mendifinisikan secara spesifik halaman mana yang akan dibagnun dan bagimana transisi visualnya akan ditampilkan kepada pengguna.

import 'package:flutter/material.dart';

class SesiNavigation extends StatelessWidget {
  const SesiNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation'),
        leading: Icon(Icons.arrow_back_rounded),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            spacing: 12,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Navigator Push'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Navigator Pop'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// PRAKTIK TERBAIK UNTUK MENGINGKATKAN KUALIUTAS SISTEM NAVIGASI

// 1, PIKIRKAN TENTANG MEMORI:
// Jangan melakukan PUSH terus menerus tanpa POP karena itu membuat tumpukan kartu Anda sangat tinggi dan memberatkan RAM ponsel.

// 2. GUNAKAN CONSSTRUCTOR UNTUK INPUT:
// Cara termudah mengirim data "maju" adalah lewat constructor.

// 3. CEK KEBERADAAN CONTEXT: Pastikan Anda memiliki akses ke CONTEXT yang valid. Jika Anda mencoba navigasi di dalam fungsi yang jauh dari UI, pastikan CONTEXT tersebut diterskan sebagai argumen fungsi

// Menggunakan motekde NAVIGATOR.PUSH dan POP memang merupakan gerbang pembuka uang paling ideal bagi pemula dalam mempelaharu NAVIGASI di Fluuter. Pendekatan ini sangat diminati karena keserhanaanya yang tidak memerlukan konfigurasi global yang rumit.
