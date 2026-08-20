import 'package:flutter/material.dart';

class SesiListViewBuilder extends StatelessWidget {
  const SesiListViewBuilder({super.key});

  final List<String> friendsName = const <String>['Budi', 'Andi', 'Caca'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: friendsName.length,
        // Menyesuaikan dengan jumlah data di variable list
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
              child: Text('${index + 1}'),
            ),
            title: Text(friendsName[index]),
            subtitle: Text('Nama teman ke-$index'),
            onTap: () {
              print('Anda menghubungi ${friendsName[index]}');
            },
          );

          // Variabel index membantu kita mengambil data secara berurutan
        },
      ),

      // Agar LISTVIEW.BUILDER() dapat berfungsi, Anda wajib memberikan dua instruksi utama yang menjadi otak di balik efisiensinya.

      // 1. ITEMCOUNT: Yang bertugas memberikan kepastian kepada Flutter mengenai jumlah total kotak atau baris yang ada dalam antrean.

      // 2. ITEMBUILDER: Sebuah callback function yang bekerja secara dinamis untuk merakit setiap baris hanya saat akan ditampilkan di layar. Fungsi ini bekerja secara efisien dengan cara dipanggil berulang kali sesuai kebutuhan pengguna. Ia mengambil blueprint widget yang Anda siapkan dan mengisinya dengan data yang sesuai urutannya. Alhasil, sistem tidak perlu membuang energi untuk membangun baris yang belum saatnya muncul.
    );
  }
}
