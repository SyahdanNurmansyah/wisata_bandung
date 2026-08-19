import 'package:flutter/material.dart';

class SesiSwitch extends StatefulWidget {
  const SesiSwitch({super.key});

  @override
  State<SesiSwitch> createState() => SesiSwitchState();
}

class SesiSwitchState extends State<SesiSwitch> {
  bool isLightMode = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(isLightMode ? 'Light Mode' : 'Dark Mode'),
          leading: Icon(
            isLightMode ? Icons.wb_sunny_rounded : Icons.mode_night_rounded,
          ),
          trailing: Switch(
            value: isLightMode,
            onChanged: (bool value) {
              setState(() {
                isLightMode = value;
              });
            },
          ),

          // SWITCH
          // SWITCH mewakili dua kondisi absolut, yaitu On atau Off. Widget ini biasanya digunakan pada halaman pengaturan untuk tindakan instan seperti mengaktifkan Mode Gelap atua Bluetooth. Karena SWITCH memicu perubahan langsung, pastikan label yang diberikan sangat jelas agar tidak membingungkan pengguna.

          // SWTICH adalah pilihan antarmuka yang paling intuitif. Berbeda dengna tombol tekan biasa. Switch memberikan umpan balik visual yang menyerupai sakelar fisik di dunia nyata. memudahkan pengguna untuk mengaktifkan atau menonaktifkan fitur secara instan. Widget ini bekerja secara biner menggunakan nilai booelan (true atau false).

          // SWITCH memerlukan dua elemen kunci agar berfungsi dengan baik:
          // 1. VALUE: Menentukan posisi sakelar saat ini (misalnya, True untuk Mode Gelap dan False untuk Mode Terang).

          // 2. ONCHANGED: Fungsi yang akan menangkap setial kali pengguna menggeser atau mengetuk sakelar, di mana Anda bisa memasukan logika setState untuk memperbarui tema aplikasi secara langsung.

          // Potongan kode di atas menunjukan cara variabel isLightMode bertindak sebgai sumber kebenaran tunggal (single source of truth) yang mengendalikan seluruh elemen visual dalam ListTile. Ketika Sakelar pada properti trailing digeser fungsi onChanged akan memperbarui nilai isLightMode melalui setState serta secara instan memicu perubahan reaktif pada tiga bagian sekaligus: tesk (title), icon (leading), dan posisi Switch.
        ),

        SwitchListTile(
          title: Text(isLightMode ? 'Light Mode' : 'Dark Mode'),
          activeThumbColor: isLightMode ? Colors.blue : Colors.black,
          value: isLightMode,
          onChanged: (bool value) {
            setState(() {
              isLightMode = value;
            });
          },
        ),

        // Untuk mencipkaan pengalaman pengguna yang lebih mulsu, Flutter menyediakan SWTICHLISTTILE, sebuah widget terintegrasi yang menggabungkan fungsi sakelar dalam daftar satu baris kode yang efisien.
      ],
    );
  }
}
