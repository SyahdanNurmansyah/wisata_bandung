<!-- BEDAH KODE -->

1. PENAMBAHAN BERKAS home_screen.dart
Langkah awal dalam membangun antarmuka pengguna yang teriurganisir dimilai dengan pemisahan komponen melalui pembuatan berkas baru bernama home_screen.dart. Secara teknis, langkah ini bertujuan untuk menerapkan prinsip SEPARATION of CONCERNS, di mana logika tampilan utama diisolasi ke dalam satu unik mandiri agar kode program lebih mudah dikelola, dibaca, dan dikembangkan di masa depan.

Dengan memindahkan kode antarmuka dari fule utama (main.dart) ke dalam home_screen.dart, kita menciptakan struktur proyek yang lebih bersih dan profesional, memudahkan kolaborasi tim maupun proses debugging secara spesifik pada modul beranda.

2. PEMBUATAN FOLDER MODEL
Penyusunan folder MODEL yang berisi kelas TOURISMPLACE berfungsi sebagai blueprint atau cetakan dasar untuk mempresentasikan objek data di dalam aplikasi. Dengan mendifinisikan kelas ini, kita menciptakan struktur data yang konsisten (seperti nama tempat, lokasi, dan gambar) sehingga setiap informasi yang ditampilkan memiliki standarisasi yang jalas.

Secara teknis, langkah ini memudahkan proses pemanggilan data dan meminimalisasi kelasan penulisan atribut. Praktik ini memastikan bahwa logika bisni aplikasi tetap rapi dan tidak bercampur aduk dengan logika presentasi pada lapisan UI.

3. OPTIMASI UI DENGAN LISTVIEW.BUILDER
Implementasi ListView.builder pada HomeScreen berfungsi sebgai mekanisme on-demand rendering. Di mana aplikasi hanya aka nmemproses dan menampilkan item yang benar-benar terlihat di layar pengguna. Berbeda dengan ListView standar yang memuat seluruh data sekaligus ke dalam memori, builder ini bekerja secara cerdas dan mendaur ulang komponen yang sudah tidak terlihat (scroll keluar layar) untuk menampilkan data baru.

<!-- CONTOH -->
<!-- class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Wisata Bandung'),
      ),
      body: ListView.builder(
        itemCount: tourismPlaceList.length,
        itemBuilder: (context, index) {
          ...
        },
      ),
    );
  } 
}  -->

Secara teknis, penggunaan properti itemCount memberikan kepastian jumlah data, sementara itemBuilder bertindak sebagai pabrik yang menuyusun tampilan setuap barus secara dinamis berdasarkan indeksnya. Strategi ini sangat krusial untuk menjaga kelancaran animasi (frame rate) dan menghemat penggunaan memori RAM. Alhasil, aplikasi tetap reponsif meskipun daftar wisata bertambah gingga ratusan item.

4. DISTRIBUSI RUANG PROPOSIONAL DENGAN EXPANDED DAN FLEX
Penggunaan widget Expanded yang bdkombinasikan dengan properti flex merupkan strategi Responsive Design dalam Flutter untuk mencipttakan keseimbangan visual yang konsisten di berbagai ukuran layar. Secara teknis, Expanded berfungsi untuk mencegat pesan error overflow dengan cara memaksa widget anal -dalam hal ini gambar dan teks- untuk tunduk pada batas ruang yang diberikan oleh induknnya (Row).

<!-- class TourismPlaceCard extends StatelessWidget {
  ...
 
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Expanded(flex: 1, child: ...),
            Expanded(
              flex: 2,
              child: ...
            ),
          ],
        ),
      ),
    );
  }
} -->

Dengan meetapkan rsio flex: 1 dan flex 2, Anda sedang menginstruksikan sistem layouting untuk membagi total ruang yang tersedia menjadi tiga bagian sama besar, lalu mendistribusikannya secara matematis: sepertiga bagian untuk elemen visual (gambar) dan dua pertiga sisanya untuk informasi tesktual. Pendekatan ini memastikan bahwa elemen aplikasi tidak akan pernah "balapan" keluar dari bingkai layar, melaikan secara adaptif menyesuaikan lebar mereka secara dinamis namun tetap proporsional.

5. MEMBERI DIMENSI DENGAN WIDGET CARD
Implementasi widget Card dalam komponen TourismPlaceCard berfungsi untuk menciptakan Hierarki Visual melalui efek elevasi dan bayangan (shadow) yang realistis. Secara teknis, Card memberikan kesan mendalam (depth), yang secara tidak langsung berkomunikasi dengan pengguna bahwa elemen tersebut berada di lapisan yang berbda dari latar belakang dan bersifat interaktif.

<!-- class TourismPlaceCard extends StatelessWidget {
  ...
 
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            ...
          ],
        ),
      ),
    );
  }
} -->

Penggunaan properti clipBehaviorL Clip.hardEdge menjadi sangat krusial di sini. Fungsinya adalah untuk memastikan bahwa konten di dalamnya-seperti gambar pada Expanded pertama-terpotong dengan rapi mengikuti lengkungan sudut kartu sehingga estetika visual tetap terjaga tanpa ada sudut tajam yang keluar dari bingkai. Dengan membungkus seluruh konten ke dalam satu kesatuan kartu , Anda tidak hanya mempercantik tampilan, tetapi juga meningkatkan aksesibilats aplikasi dengan memberikan batas fisik yang jelas bagi area yang dapat ditekan (tappable area).

6. WIDGET INKWELL VS TOMBOL KONVENSIOBNAL
InkWell adalah widget material yang berfugnsi untuk memberikan respons interaktif berupa efek riak air (splash/ripple effect) pada area yang disentyh tanpa bentuk visual dari komponen di dalamnya. Secara teknis, perbedaan mendasar antara InkWell dan tombol biasa (seperti ElevatedButton atau TextButton) terletak pada flesibilitas desain dan padding internal; tombol biasa datang dengan gaya bawaan seperti margin, padding, dan bentuk tertentu yang sulit dihilangkan sepenuhnya, sementara InkWell bertindak sebagai "lapisan transparant" yang mengikuti widget induknya.

<!-- class TourismPlaceCard extends StatelessWidget {
  ...
 
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: ...
      ),
    );
  }
} -->

Dengan menggunakan InkWell, Anda telah berhasil memisahkan fungsi interaktif dari Elemen Visual. Strategi ini memungkinkan Anda menciptakan antar muka yang ersih dan minimalis, di mana penggua cukup mengetuk bagian manapun dari Card tersebut untuk memicu aksi, seolah-olah seluruh kartu itu sendiri adalah tombolnya.

7. SINKRONISASI KODE DENGAN QUICK FIX
Ketika kita mnambhajkan atribut onTap di TourismPlaceCard kode pada HomeScreen mengalami error. Secara defualt, Anda bisa menambah properti yang kurang secara manual. Namun dengan adanya Quick Fix di VS COde bertindak sebagai asisten otomatis yang mendeteksi ketidaksesuaian antara difinisi kelas dan impelemtasi constructor-nya dengan menekan tombl CTRL + . (Windows/Linux) atau CMD + . (Mac).

8. TRANSFER DATA ANTAR HALAMAN DENGAN NAVIGATOR
Penggunaan Navigator.push yang dikombinasikan dengan MaterialPageRoute berfungsi untuk memindahkan pengguna ke laposan layar baru sambil membawa "keranjang" data beruba objek tourismPlace. Alih-alih mengirim satu ID atau string nama, Anda mengirim seluruh referensi objek yang berisi gambar, lokasi, dan deskripsi ke dalam constructor DetailScreen.

<!-- return TourismPlaceCard(
  tourismPlace: tourismPlace,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DetailScreen(tourismPlace: tourismPlace);
        },
      ),
    );
  },
); -->

Pendektan ini sangat menguntungkan karena halaman detail tidak perlu melakukan pencarian data ulang dari daftar utama. Semua informasi yang dibutuhkan sudah terseda dan siap ditampilkan seketika saat transisi halaman selesai. Dengan menggunakan MaterialPageRoute, Flutter secara otomatis memberikan animasi standar platform (seperti geser ke atas di IOS atau meemudar di Android) serta menyediakan tombol "back" secara otomatis pada halaman tujuan.

Namun, adalahnya mengirim satu objek utuh terasa seperti "membawa seluruh koper padahal hanya butuh kunci". Mnegirimkan ID atau string nama adalah stratefi yang lebih efisien dan terukur, terutama saat aplikasi Anda mulai berinteraksi dengan database/server.

Sebagai gambaran. kita anggap sistem aplikasi kita sudah berinteraksi dengan server. Ketika dibutuhkan informasi detail terkait wisata, Anda perlu mengirimkan data ID, daam kasus ini adalah string nama. Anda bisa ubah constructor kelas DetailScreen menjadi seperti berikut:

<!-- class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.tourismPlaceName})
    : tourismPlace = tourismPlaceList.firstWhere(
        (place) => place.name == tourismPlaceName,
      );
  final TourismPlace tourismPlace;
  final String tourismPlaceName;
 
  final informationTextStyle = const TextStyle(fontFamily: 'Oxygen');
  ...
} -->

Hal yang dibutuhkan oleh DetailScreen adlah tourismPalceName atau string nama, bukan objek tourismPlace, akan tetapi, untuk mendapatkan data toursmplace, kita bisa mencarinya melalui "database lokal atau data status yang sudah dimiliki sebelumnya. Kita bisa proses pencarian data tourismPlace melalui initiliazer list pada constructor. Ia terletak setelah titik dua (:).

<!-- DetailScreen({super.key, required this.tourismPlaceName})
    : tourismPlace = tourismPlaceList.firstWhere(
        (place) => place.name == tourismPlaceName,
      ); -->


Jadi, saat ini DetailScreen membutuhkan string tourismPlaceName. Hal ini akan berefek pada pemanggilan DetalScreen pada HomeScreen. Alhasil, kodenya menjadi seperti berikut:

<!--  HOME_SCREEN

return TourismPlaceCard(
  tourismPlace: tourismPlace,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DetailScreen(tourismPlaceName: tourismPlace.name);
        },
      ),
    );
  },
); -->

9. LAPISAN VISUAL DENGAN STACK DAN POSITIONED
Widget Stack berfungsi sebagai kontainer yang menyusun child widget-nya dari belakang ke depan mirip dengan cara kita menumpuk lembaran ke depan mirip denga cara kita menumpuk lembaran kertas di atas meja. Secara teknis, elemen pertama yang didefinisakn dalam daftar childer akan berada di lapisan paling bawah (dasar), sementara elemen berikutnya akan menumpuk di atasnya.

<!-- Stack(
  children: [
    Image.asset(tourismPlace.imageHeader),
    IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
      color: Colors.white,
      style: IconButton.styleFrom(backgroundColor: Colors.grey),
    ),
    Positioned(right: 0, top: 0, child: FavoriteIcon()),
  ],
), -->

Dalam kode Anda, Image.assets menjadi fondasi, diikuti oleh IconButton yang muncul di atas gambar tersebut. Untuk memberikan kontrol persisi, widget Positionel digunakan sebagai pembungkis khusus di dalam Stack yang memungkinkan Anda menentukan koorndinat spesifik-seperti righ: 0 dan top: 0 untuk meletakkan elemen di pojok tertentu tanpa memengaruhi posisi elemen lainnya.


10. REAKTIVITAS UI DENGAN STATEFULWIDGET DAN SETSTATE
StatefulWidget digunakan ketika sebuah widget perlu menyimpan informasi yang dapat berubah selama aplikasi berjalan, dalam hal ini adalah state sebuah tempat wisata sudah difavoritekan atau belum. Secara teknis, kelas FavoriteIcon dibagi menjadi dua bagian: widget itu sendiri (FavoriteIcon) dan objek State (_FavoriteIconState) yang menampung variabel isFavorite.

<!-- class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({super.key});
 
  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}
 
class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFavorite = false;
 
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
      color: Colors.red,
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
} -->

Saat fungsi setSte dipanggil di dalam onPressed, Anda sedang memberikan sinyal kepada Flutter bahwa ada perubahan pada data internal (dari false ke true atau sebaliknya). Sinyal ini memicu Flutter untuk menjalankan ulang fungsi build sehigga UI akan digambar ulang secara instan dengan ikon yang sesuai. 