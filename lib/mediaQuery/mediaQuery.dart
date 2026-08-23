// MEDIA QUERY
// Pengguanaan MediaQuery dimulai dengnan memanggil MediaQuery.of(context) yang berfungsi untuk menarik informasi spesifik dari wdiget tree mengenai ukuran layar atau preferensi sistem pengguna. Data yang paling umum digunakan adalah properti size, yang memberikan nilai lebar (width) dan tinggi (height) lauar dalam satuan pixel

// Mengambil data Size (ukuran layar)
// Size screenSize = MediaQuery.of(context).size;

// Mengambil data Orientasi (orientasi layar)
// Orientation orientation = MediaQuery.of(context).orientation;

// -------------- KEKURANGAN ----------------
// Meskipun MediaQuery menyediakan data uyang sangat lengkap, memanggilnya secara sembarangan dapat memicu beban komputasi yang tidak perlu karena sifatnya yang sensitif terhadap perubahan. Ketika Anda memangguil MediaQuery.of(context), widget tersebut akan belangganan (subscribe) terhadap seluruh obhek MediaQueryData.

// Hal ini menyebabkan widget akan melaluukan rebuild (membangun ulang) secara keseluruhan setiap kalo terjadi perubhana kecil pada sistem. Contohnya seperti munculnya keyboard on-screen atau perubahan orientasi. Hal ini menciptakan siklus render yang boros baterai dan beban CPU yang tinggi, terutama jika diletakkan pada baguan atas widget tree yang memiliki banyak child widget.

// --------------- SOLUSI ------------------
// Solusi paling efektif untuk menjaga performa aplikasi adalah dengan menggati pemanggilan MediaQuery.of(context) menggunakan metode selektif seperti .sizeOf(context) atau .orientasiOf(context). Semua properti dari MediaQueryData bisa diakses dengan menggunakan format MediaQuery.{properti}Of(context). Dengan menggunakan metode yang lebih spesifik ini widget Anda hanya akan mendengarkan perubahan pada properti tertentu yang memang dibutuhkan, bukan pada seluruh objek data sistem.

// Alhasil seperti ini:
// Size screenSize = MediaQuery.sizeOf(context);
// Orientasi orientasi = MediaQuery.orientasiOf(context);

// VERSI LENGKAP:
import 'package:flutter/material.dart';

class SesiMediaQuery extends StatelessWidget {
  const SesiMediaQuery({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    Orientation orientation = MediaQuery.orientationOf(context);

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .stretch,
        children: [
          Text(
            'Screen widget ${screenSize.width.toStringAsFixed(2)}',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            'Orientation $orientation',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
