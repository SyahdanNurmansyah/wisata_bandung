import 'package:flutter/material.dart';

class SesiListView extends StatelessWidget {
  const SesiListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // LISTVIEW DASAR
        // Metode ini sangat ocok jika Anda sudah tau pasti berapa jumlah itemnya dan jumlahnya tidak banyak. Misalnya, Anda ingin menampilkan menu pengaturan yang hanya berisi 5-10 pilihan.
        children: [
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('Pengaturan Profil'),
            trailing: Icon(Icons.chevron_right),
            onTap: () => print('KLik Profil'),
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.red),
            title: Text("Notifikasi"),
            trailing: Icon(Icons.chevron_right),
            onTap: () => print("Klik Notifikasi"),
          ),
        ],
      ),

      // Penggunaan LISTVIEW STANDAR sangat ideal ketika Anda menghadapi daftar yang bersifat statis dan memiliki jumlha item yang sedikit. Sistem ini seperti kombinasi SINGLECHILDSCROLLVIEW + COLUMN, ia membuat seluruh widget secara bersamaan di dalam memori. Jadi, ia akan cocok dengan jumlah item yang sudah jelas ditentukan dan tidak terlalu banyak.

      // Selama jumlah itemnya terbatas, beban kerja prosesor ponsel tidak akan terganggu, dan Anda mendapatkan kemudahan dalam menulis kode yang lebih sederhana tanpa perlu mengatur logika builder yang kompleks. Singkatnya, gunakan metode ini jika Anda sudah tahu pasti bahwa "conveyor" Anda hanya akan mengangkut segelintir kotak yang isinya jarang berubah.
    );
  }
}
