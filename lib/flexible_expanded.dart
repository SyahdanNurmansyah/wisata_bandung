// FLEXIBLE & EXPANDED

// FLEXIBLE itu seperti Penunpang yang Efisien.
// Dia akan dudk di kursinya dengan nyaman. Jika kursi yang disediakan sangan luas, dia tetap ganya mengambil ruang sesuai ukuran tubuhnya dan menyisakan kursi kosong di sebelanya agar bus tidak terasa sesak. Penumpang ini menghargai ruang publik.

// EXPANDED itu seperti Penumpang yang Ingin Dominan
// Begitu dia masuk bu, dia akan melihat semua kursi kosong yang tersisa dari depan sampai belakang. Dia tidak peduli seberapa kecil tubuhnya, dia akan merentangkan tangannya, menaruh tas di kursi sebelah, dan mengambil seluruh sisa ruang sampai tidak ada lagi kursi kosong yang tesisa. Dia memastiakn tidak ada ruang yang mubazir di dalam bus, mesikup itu berarti dia harus "meregangkan" dirinya.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SesiFlexibleExpanded extends StatefulWidget {
  const SesiFlexibleExpanded({super.key});

  @override
  State<SesiFlexibleExpanded> createState() => _SesiFlexibleExpandedState();
}

class _SesiFlexibleExpandedState extends State<SesiFlexibleExpanded> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: ContainerWidget(
                color: Colors.redAccent,
                text: 'Flexible 1',
                icon: Icons.blur_off_outlined,
              ),
            ),

            const SizedBox(width: 12),
            Flexible(
              child: ContainerWidget(
                color: Colors.lightGreen,
                text: 'Flexible 2',
                icon: Icons.blur_on_outlined,
              ),
            ),

            // FLEXIBLE
            // Widget Flexible bertindak seperti "karet gelang" yang memberikan flesibilitas pada widget anak di dalam sebuah ROW atau COLUMN. Jika secara standar widget akan mengambil ruang sesuai uuran aslinya (yang sering kali memicu overflow error atau tesk terpotong), FLEXIBLE memerintahkan widget tersebut untuk menyesuaikan diri dengan sisa ruang yang tersedia tanpa memaksanya untuk mengisi seluruh ruang tersebut jika memang tidak diperlukan.

            // PORPTERTI PERTING DARI FLEXIBLE = FLEX
            // FLEX berfungsi sebagai penentu bobot atau rasio distribusi ruang sisa di dalam ROW dan COLUMN/ Secara default, nilai FLEX bernilai 1. Akan tetapi, bisa mengubah angka tersebut sehingga membuat tata letak yang proporsional dan dinamis.
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Flexible(
              child: ContainerWidget(
                icon: Icons.ac_unit,
                text: 'Flexible 3',
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          spacing: 12,
          children: [
            Expanded(
              child: ContainerWidget(
                color: Colors.amberAccent,
                icon: Icons.card_giftcard,
                text: 'Expanded 1',
              ),
            ),
            Expanded(
              child: ContainerWidget(
                color: Colors.blueAccent,
                icon: Icons.party_mode_outlined,
                text: 'Expanded 2',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ContainerWidget(
                color: Colors.purpleAccent,
                icon: Icons.animation_outlined,
                text: 'Expanded 3',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ContainerWidget(
                icon: Icons.access_alarm_rounded,
                text: 'Expanded',
                color: Colors.deepOrangeAccent,
              ),
            ),
            Flexible(
              child: ContainerWidget(
                icon: Icons.account_tree,
                text: 'Flexible',
                color: Colors.pinkAccent,
              ),
            ),
          ],
        ),

        // EXPANDED
        // EXPANDED adalah "pahlawan" dalam desain responsif Flutter. Secara teknis, EXPANDED hannyalah sebuah FLEXIVEL yang sudah disetel ke mode tight. Saat Anda membungkus sebua widget dengan EXPANDED, Anda memberikan perintah mutlak: "Gunakan semua ruang kosong yang tersisa sekarang juga!"

        // SKENARIO PENGGUNAAN YANG UMUM: APLIKASI CHAT
        // Mari kita bedah struktur aplikasi chat. Dalam sebuah baris (ROW), biasanya ada berapa komponen:

        // 1. TOMBOL EMOJI: (SISI KIRI)
        // Ibarat gerbong masinis yang memiliki ukuran tetap dan tidak berubah. Di layar manapum ruang yang dbutuhkan tetap sama agar mudah diaskses oleh jempol pengguna.
        // 2. KOTAK INPUT (TENGAH): Banyangkan ini sebagia gerbong penumpang yang fleksibel yang panjanganya bisa bertambah atau berkuraung secara otomatis. Pada ponsel yang lebar, gerbong ini akan memajng untuk memberi ruang megnetik yang lebih lga, sementara ponsel kecil. ia akan mengerut tanpa menggeser tombol lainnya keluar layar.

        // 3. TOMBOL KIRIM/MIKROFON (SISI KANAN): Ini adalah gerbomg belakang yang juga memiliki ukuran tetap. Komponen ini "Mengunci" posisi di ujung kanan baris, Memastikan ikon kirim selalu tersedia tanpa terutup oleh kode tesk memanjang

        // TANPA EXPANDED pada kolom input, FLUTTER tidak akan tau seberaapa lebar kotak terswebut harus dibuat, dan kemungkinan besar akan terjadi ovverflow jika Anda mengetik kalimat panjang.
      ],
    );
  }
}

class ContainerWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const ContainerWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        spacing: 12,
        mainAxisAlignment: .center,
        children: [
          Icon(icon, color: Colors.white),

          Flexible(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Secara visual, widget EXPANDED akan mendominasi area yang tersedia dibanding FLEXIBLE.

// PROPERTI FLEX
// Berbicara tentang FLEX, ini adalah properti FLEXIBLE dan EXPANDED yang berfungsi sebagai penentu bobot atau ratio distribusi ruang sisa di dalam ROW atau COLUMN
