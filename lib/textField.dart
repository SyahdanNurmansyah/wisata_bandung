import 'package:flutter/material.dart';

class SesiTextField extends StatefulWidget {
  const SesiTextField({super.key});

  @override
  State<SesiTextField> createState() => _SesiTextFieldState();
}

class _SesiTextFieldState extends State<SesiTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          // Mengontrol dan memanpulasi tesk yang ada di TextField
          keyboardType: TextInputType.text,
          // Menagatur jenis keyboard
          obscureText: false,
          // Menyamarkan tesk
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.black54),
            hintText: 'Write keyword here...',
            hintStyle: TextStyle(color: Colors.grey),
            labelText: 'Search',
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            suffixIcon: Icon(Icons.tune),
          ),
          onChanged: (value) {
            debugPrint('Update $value');
          },
          // Callback fungction yang dapat digunakan untuk menjalankan aksi tertentu ketika ada perubahan tesk pada TextField
        ),

        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('${_controller.text} tidak ditemukan'),
                );
              },
            );
          },
          child: Text('Submit'),

          // onChanged: (String value) {
          //             setState(() {
          //               _name = value;
          //             });
          //           },
          // Dalam mengelola input pengguna secara real-time, properti onChanged pada TextField berperan sebagai jembatan utama untuk memperbarui data aplikasi. Dengan memanggul fungsi setState di dalam callback tersebut, setiap ketikan tombol atau perubahan karakter yang dilakukan pengguna akan langsung memiu perbaruan state. Mekanisme ini memastikan bwah variabel penyimpanan data tetap selaas dengan tampilan visual, sehingga aplikasi dapat merespons input secara instan tanpa perlu menunggu tombol kirim ditekan.

          // onSubmitted: (value) {
          //   print("onSubmitted");
          //   setState(() {
          //     _name = value;
          //   });
          // },

          // onSubmitted untuk menangani lokgika yang hanya perlu dieksekusi saat pengguna selesai mengisi tesk. Properti ini sangat efektif untuk akse final seperti mengirim formulir, memicu fungsi pencarian, atau berpindah ke kolom input berikutnya seletah pengguna menekan tombol "Done" atau "Enter" pada keyboard.
        ),
      ],
    );
  }
}
