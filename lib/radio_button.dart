import 'package:flutter/material.dart';

class SesiRadioButton extends StatefulWidget {
  const SesiRadioButton({super.key});

  @override
  State<SesiRadioButton> createState() => _SesiRadioButtonState();
}

class _SesiRadioButtonState extends State<SesiRadioButton> {
  String? language;
  @override
  Widget build(BuildContext context) {
    return RadioGroup(
      groupValue: language,
      onChanged: (value) {
        setState(() {
          language = value;
          showSnackbar();
        });
      },
      child: const Column(
        children: [
          ListTile(
            leading: Radio(value: 'Dart'),
            title: Text('Dart'),
          ),
          ListTile(
            leading: Radio(value: 'Swift'),
            title: Text('Swift'),
          ),
          ListTile(
            leading: Radio(value: 'Kotlin'),
            title: Text('Kotlin'),
          ),

          Text('Versi Simple: RadioListTile'),
          RadioListTile(value: 'Indonesia', title: Text('Indonesia')),
          RadioListTile(value: 'Indonesia', title: Text('Inggris')),
          RadioListTile(value: 'Indonesia', title: Text('Belanda')),
        ],
      ),
    );

    // VALUE: Setiap tombol diberikan identitas unik melalui value.
    // GROUPVALUE: Bertndak sebagai penentu tunggal untuk seluruh kelompok tombol tersebut.
    // ONCHANGED: Akan menangkap nilai unik dari tombol tersebut dan mengirimkannya ke fungsi setState.
  }

  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$language selected'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

// RADIO BUTTON
// Radio dirancang khusus untuk mengangani situasi di mana pengguna harus membuat keputusan tunggal dari sekumpulan opsi yang tersedia. Dalam logika pemrograman, komponen ini menerapkan sifat mutually exclusive. Artinya, pemilihan satu opsi secara otomatis akan membatalkan pilihan pada opsi sebelumnya.

// Karakteristik ini sangant krusian untuk data yang tidak boleh tumpang tindih, seperti penentuan jenis kelamin, pemilihan metode pembayaran, atau pengembalian paket langganan, di mana sistem hanya memerlukan satu input valid untuk memproses langkah berikutnya. Dengan begitu, data yang dipilih oleh user hanya satu saja.

// Inti dari mekanisme kerja Radio Button terletak pada perbandingan antara properti value dan groupValue. Setiap tombol diberikan identitas unik melalui value, sementara variable groupValue bertindak sebagai penentu tinggal untuk seluruh kelompok tolbol tersebut.
