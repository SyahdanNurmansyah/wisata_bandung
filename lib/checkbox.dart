// --------------------------- CHECKBOX ---------------------------

// CHECKBOX merupakan elemen antarmuka yang dirancang khusus untuk mengakomodasi skenario pemilihan jamak (multiple choice).
//  Berbeda dengan sistem pilihan tunggan yang hanya memerlukan satu variabel penampung, setiap CHECKBOX merepresentasikan satu nilai biner yang berdiri sendiri. Dalam kasus daftar hobi, hal ini berarti setuap opsi (seperti: "Membaca", "Ngoding", "Menulis") harus memiliki status boolean (true atau false), masing-masing untuk melacak apakah opsi tersebut dipilih atau tidak.

// Agar pengelilaan data menjadi lebih terstruktur dan mudah dikontrol, sangat disarankan untuk membungkus data tersebut ke dalam sebuah CLASS.

import 'package:flutter/material.dart';

class SesiCheckbox extends StatefulWidget {
  const SesiCheckbox({super.key});

  @override
  State<SesiCheckbox> createState() => _SesiCheckboxState();
}

class _SesiCheckboxState extends State<SesiCheckbox> {
  final List<HobbyItem> _hobbies = [
    HobbyItem(title: 'Ngoding'),
    HobbyItem(title: 'Membaca'),
    HobbyItem(title: 'Menulis'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ..._hobbies.map((hobby) {
          return Column(
            children: [
              // ListTile(
              //   title: Text(hobby.title),
              //   leading: Checkbox(
              //     value: hobby.isChecked,
              //     onChanged: (value) {
              //       setState(() {
              //         final index = _hobbies.indexOf(hobby);
              //         _hobbies[index] = hobby.copyWith(
              //           isChecked: value ?? false,
              //         );
              //         showSnackbar();
              //       });
              //     },

              // Fungsionalitas utama dari sebuah CHECKBOX dibangun oleh dua properti yang saling melengkapi, yaitu VALUE dan ONCHANGED. Properti VALUE berfungsi sebagai penentu statsu visual, di mana nilai boolean (true atau false) akan menentukan apakah kotak tersebut tampak tercentang atau kosong.

              // Sementara itu, ONCHANGED adalah sebuah callback atau fungsi pemicu yang akan berjalan setiap kali pengguna mengetuk kotak tersebut.
              //   ),
              // ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity
                    .leading, // Memindahkan posisi checkbox ke sisi kiri title
                title: Text(hobby.title),
                value: hobby.isChecked,
                onChanged: (value) {
                  setState(() {
                    final index = _hobbies.indexOf(hobby);
                    _hobbies[index] = hobby.copyWith(isChecked: value ?? false);
                  });
                  showSnackbar();
                },
              ),
              // CHECKBOXLISTTILE adalah solusi yang lebih efisien, cepat, dan rapi, dibandingkan menggabungkan widget secara manual.

              // Widget ini merupakan komponen paket lengkap yang menggabungkan CHECKBOX dengan label tesk (title). deskripsi tambahan (subtitle), hingga ikon (secondary) dalam stau baris yang sidaj terformat dengan standar desain yang baik.
            ],
          );
        }),
      ],
    );
  }

  void showSnackbar() {
    final message = _hobbies
        .where((hobby) => hobby.isChecked)
        .map((hobby) => hobby.title)
        .join(', ');

    final text = message.isEmpty
        ? 'No hobbies selected'
        : 'Selected hobbies: $message';

    final scaffoldMessanger = ScaffoldMessenger.of(context);
    scaffoldMessanger
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(text)));
  }
}

class HobbyItem {
  final String title;
  final bool isChecked;

  const HobbyItem({required this.title, this.isChecked = false});
  HobbyItem copyWith({String? title, bool? isChecked}) {
    return HobbyItem(
      title: title ?? this.title,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}

// Membangun aplikasi yang interaktif bukan hanya soal memastikan fitur berjalan dengan benar, tetapi juga tentang bagaimana menjaga aolikasi tetap sehat, aman, dan nyaman digunakan dalam jangka panjang (best practice). 

// 1. MEMORY MANAGEMENT: Selalu panggil dispose() pada TextEditingController untuk mencegah kebocoran memori (memori leak).
// 2. VALIDASI: Selalu cek input penggua sebelum memperoses data untuk menghindari error atau data kosong.
// 3. UX & AKSESIBILITAS: Gunakan varian LISTTILE agar area sentuh lebih luas dan memudahkan pengguna dengan perangkat layar kecil.
// 4. FEEDBACK: Gunakan warna aktif yang kontras atau pesan pemberitahuan (SnackBar) agar pengguna tahu bahwa aksi mereka telah berhasil diproses.