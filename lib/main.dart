import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Wisata Bandung',
      home: DetailScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Text(
          'Detail Wisata',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_rounded),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.star_border_rounded, size: 28),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.turn_right_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Farm House Lembang',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: .spaceEvenly,
                    crossAxisAlignment: .start,
                    children: [
                      Column(
                        spacing: 8,
                        children: [
                          Icon(Icons.calendar_today_outlined, size: 32),
                          Text('Open Everyday'),
                        ],
                      ),
                      Column(
                        spacing: 8,
                        children: [
                          Icon(Icons.access_time, size: 32),
                          Text('09:00 - 20:00'),
                        ],
                      ),
                      Column(
                        spacing: 8,
                        children: [
                          Icon(Icons.monetization_on_outlined, size: 32),
                          Text('Rp 25.000'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Column(
                  spacing: 16,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable.',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        elevation: 0,
                        foregroundColor: Colors.blue.shade100,
                        padding: const EdgeInsets.all(16),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: SizedBox(
                                width: 400,
                                height: 100,
                                child: Column(
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    Text(
                                      'Hello World! Selamat Anda berhasil uji coba tombol ini!',
                                      style: TextStyle(fontSize: 18),
                                    ),

                                    Row(
                                      spacing: 16,
                                      mainAxisAlignment: .end,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Keluar'),
                                        ),
                                        FilledButton(
                                          style: FilledButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Text('Lanjut'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Row(
                        spacing: 12,
                        mainAxisAlignment: .center,
                        children: [
                          Text(
                            'Lihat detail',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 18.0,
                            ),
                          ),

                          Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.grey.shade600,
                            size: 20,
                          ),
                        ],
                      ),
                    ),

                    Form(child: SesiTextField()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
          keyboardType: TextInputType.text,
          obscureText: false,
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
        ),
      ],
    );
  }
}
