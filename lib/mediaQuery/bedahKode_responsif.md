1. PENERAPAN RESPONSIVE LAYOUT DENGAN LAYOUTBUILDER
Penerapan LayputBuilder adalah kunci utama dalam tidak hanya sekedar "bisa jalan", tetapi juga enak dipandang. Dengan widget ini, kita memindahkan kendali desain dari ukuran lauar fisik ke ukuran ruang (container) yang tersedia.

Inti dari pembuatan widget responsif menggunakan LayoutBuider terletak pada kemampuannya untuk mencegat informasi batasan ruang melalui parameter constraints sebelum child widget di-render. Alih-alih menggunakan ukuran layar global yang statis, LayoutBuilder memungkinkan kita mengambil nilai constraints.maxWidth unutk menentukan strategi penyusunan elemen secara cerdas.

<!-- LayoutBuilder (
    builder (context, constraints) {
        final maxWidth = constraints.maxWidth;
        if (maxWidth <= 600) P
        return TourismPlaceList();
    } else {
        return Center (
            child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 900),
                child: TourismPlaceGrid(),
            )
        )
    }
) -->

Misalnya, kita dapat menerapkan logika percabangan sederhana. Jika lebar ruang lebih kecil dari 600 piksel, tampilkan daftar dalam satu kolom (ListView). Namun, jika ruang melampui batas tersebut, sistem secara otomatis akan beralih ke format kisi (GridView).

Pendekatan ini memastikan bahwa setiap komponen teteap proporsional dan tidak meninggalkan ruang kosong yang canggung, Selain itu, ini memberikan pengalaman pengguna yang konsisten baik pada perangkat ponsel, tablet, maupun tampilan web.

2. EFISIENSI ALUR KERJA DENGAN TEKNIK "WRAP WITH BUILDER"
Pada latihan ini, kita sering memanfaatkan LayoutBuilder. Untuk mempercepat proses development, kita dapat memanfaatkan shortcut Ctrl + . (atau Cmd + . di Mac) untuk membungkus widget dengan Builder sebagai fondasi awal. Mengingat Builder memiliki struktur callback yang serupa, kita cukup melakukan modifikasi manual dengan mengubah nama kelas menjadi LayoutBuilder dan menambahkan parameter constraints pada fungsi builder-nya.

Trik ini jauh lebih efisien dibandingkan menulis seluruh struktur kode dari awal. VS Code akan otomatis menangani penutupan kurung dan struktur indentasi. Alhasil, kita hanya perlu fokus pada penyesuaian logika responsif berdasarkan nilai lebar maksimal yang ditangkap.

Berikut empat langkah cepat membungkus widget dengan LayoutBuilder.

Klik pada widget yang ingin dibungkus.
Gunakan shortcut Wrap with Builder.
Ubah kata kunci Builder menjadi LayoutBuilder.
Tambahkan parameter kedua pada callback: (context, constraints).
Ini adalah trik cerdas yang sering dilakukan para developer berpengalaman untuk menjaga alur kerja tetap cepat. Karena VS Code melalui ekstensi Flutter tidak menyediakan shortcut khusus untuk LayoutBuilder secara bawaan, teknik "bungkus-lalu-ubah" menjadi solusi paling praktis.

3. PENGGUNAAN WIDGET PLACEHOLDER
Dalam proses pengembangan UI, penggunaan widget Placeholder bertindak sebagai instrumen visual sementara untuk menjaga alur kerja tetap fokus. Widget ini berfungsi sebagai "penanda wilayah" yang secara otomatis akan menggambar sebuah kotak dengan garis diagonal menyilang untuk merepresentasikan area yang nantinya akan ditempati oleh komponen asli. 

Dengan memanfaatkan Placeholder, kita dapat memvisualisasikan struktur besar tata letak (layout) dan mendistribusikan proporsi ruang tanpa harus teralihkan oleh detail aset seperti gambar atau ikon yang mungkin belum siap. Ini adalah cara yang sangat efektif untuk memastikan bahwa logika layouting dan pembagian ruang sudah tepat sebelum kita masuk ke tahap pemolesan desain yang lebih detail.


4. PEMANFAATAN WIDGET GRIDVIEW
Perbedaan mendasar antara kedua widget ini terletak pada dimensi penyusunan elemennya. ListView dirancang khusus unutk menampilkan koleksi data secara linear atau satu arah, biak itu vertikal maupun horizontal. Dengan begitu, ia sangat efektif untuk daftar informasi yang ringkas seperti menu pengaturan atau linimasa pesan. Sebaiknya, GridView berfungsi untuk menysyn elemen dalam format dua dimensi (baris dan kolom) secara sekaligus.

Dengan menggunakan GridView, kita dapat memanfaatkan lebar layar secara lebih optimal, terutama pada perangkat ke bawah dalam satu kolom tunggal, melainkan dapat menyebar ke samping untuk menciptakan tampilan galeri yang lebih padat dan informatif.

Mengapa beralih ke GridView? Dalam kasus komponen yang sebelumnya terlihat tidak proporsional (terlalu banyak ruang kosong di sisi kanan), GridView adalah solusinya. Pilihan untuk beralih ke GridView bukan sekadar masalah selera estetika, melainkan strategi untuk memecahkan masalah efisiensi ruang. Ketika kita menggunakan daftar satu kolom pada layar yang lebar, konten cenderung "terpaksa" melebar atau justru menyisakan kekosongan di sisi samping yang membuat tampilan terlihat tidak seimbang.

Pada penerapan GridView, ada parameter wajib yang harus ada, yaitu gridDelegate. Ia berfungsi sebagai pemberi instruksi mengenai bagaimana setiap item harus diposisikan di dalam ruang dua dimensi. JIka GridView adalah wadahnya, gridDelegate adalah cetakan atau aturan mainnya.

<!-- return GridView.builder(
 gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
   maxCrossAxisExtent: 350,
   childAspectRatio: 0.8,
 ),
 itemCount: tourismPlaceList.length,
 itemBuilder: (context, index) {
   ...
 },
); -->

Parameter ini bertanggung jawab penuh untuk menghitung berapa banyak kolom yang harus dibuat, berapa jarak antar kotak (spacing), hingga berapa rasio perbandingan antara lebar dan tinggi setiap item-nya. Tanpa adanya delegasi tugas ini, GridView tidak akan tahu cara membagi ruang yang tersedia, sehingga gridDelegate menjadi kunci utama dalam menciptakan struktur visual yang rapi, presisi, dan konsisten di seluruh layar aplikasi.

Ada dua jenis delegate yang umum digunakan.

1. SLiverGridDelegateWithFixedCrossAxisCount:
Digunakan saat Anda ingin menentukan jumlah kolom secara absolut(misalnya: "Saya ingin tepat 2 kolom, tidak peduli berapa lebar layarnya").
2. SliverGridDelegateWithMaxCrossAxisExtent:
Digunakan saat Anda lebih memprioritaskan ukuran maksimal setiap item (misalnya: "Setiap kotak maksimal lebarnya 200px, silahkan hitung sendiri berapa kolom yang muat di layar ini").

Sekarang, kita coba bedah penggunaan delegate satunya, yaitu SliverGridDelegateWithFixedCrossAxisCount.

Berbeda dengan pendekatan sebelumnya yang mengutamakan ukuran maksimal, SliverGridDelegateWithFixedCrossAxisCount memberikan kendali kepada developer untuk menentukan jumlah kolom yang statis. Dengan delegate ini, Anda menetapkan angka pasti melalui parameter crossAxisCount -misalnya angka 2- dan sistem akan secara paksa membagi lebar layar yang tersedia menjadi dua bagian yang sama rata, tidak peduli lebar atau semputnya layar tersebut.

<!-- return GridView.builder(
 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
   crossAxisCount: 2,
 ),
 itemCount: tourismPlaceList.length,
 itemBuilder: (context, index) {
   …
 },
); -->

Metode ini sangat ideal digunakan ketika desain Anda menuntut jumlah kolom yang konsisten untuk menjaga alur informasi, atau saat Anda ingin mengombinasikannya dengan logika kondisional di dalam LaypurBuilder. Dengan menetapkan jumlah kolom secara manual, Anda memiliki kendali penuh atas hierarki visual. Alhasil, risiko munculnya ukuran item yang yang terlalu kecil atau terlalu besar pada resolusi lauar tertentu dapat diminimalisir melalui perhitungan yang lebih terukur.