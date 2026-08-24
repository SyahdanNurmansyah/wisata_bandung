<!-- -------------- BUILD APK -------------- -->

Project Flutter yang telah dibuat dapat kita build menjadi berkas .apk yang dapat berjalan di Android.

AndoridManifest.xml
Sebelum mem-build APK, kita akan mengatur berkas android/app/src/main/AndroidManifest.xml. AndroidManifest.xml merupakan sebuah berkas yang berisikan informasi tersebut berupa nama aplikasi, ikon, permission, screen orientation, dan lain-lain.

1. SETTING NAMA APLIKASI
android:label="wisata_bandung"

Dari:
       android:label="wisata_bandung"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">

Mejadi:
       android:label="Nama Aplikasi"
        android:name="$io.flutter.app.FlutterApplication"
        android:icon="@mipmap/ic_launcher">

Isikan android:label dengan nama aplikasi yang diinginkan. Anda bisa gunakan library https://pub.dev/packages/change_app_package_name untuk menghasilkan nama aplikasi dari pubspec.yaml.

2. SETTING IKON APLIKASI
android:icon="@mipmap/ic_launcher">

Secara default ikon aplikasi Flutter kita adalah ikon Flutter. Untuk mengubah Icon aplikasi dengan mudah, kita akan mengganti gambar ic_launcher yang berada pada folder android/app/src/main/res/ yang terbagi menjadi mipmap (ukuran resolusi ikon).

Hal yang pertama kita lakukan adalah membuat ikon aplikasi dengan Android Asset Studio. https://romannurik.github.io/AndroidAssetStudio/icons-launcher.html#foreground.type=clipart&foreground.clipart=android&foreground.space.trim=1&foreground.space.pad=0.25&foreColor=rgba(96%2C%20125%2C%20139%2C%200)&backColor=rgb(68%2C%20138%2C%20255)&crop=0&backgroundShape=circle&effects=none&name=ic_launcher

Dengan Android Asset Studio, kita dapat membuat ikon aplikasi dengan mudah dan nantinya akan terbuat dalam berbagai resolusi (mipmap). Setelah membuat ikon sesuai dengan keinginan, tekan tombol download yang ada di kanan atas.

Setelah mengunduh, unzip-lah berkas tersebut dan temukan folder res/ di dalamnya. Lalu copy folder res/ ke android/app/src/main/res/ untuk mengganti ic_launcher.png pada setiap mipmap dengan ikon aplikasi yang baru. Atau Anda bisa gunakan library berikut untuk menghasilkan icon launcher dari pubspec.yaml.

3. SHARING PERIZINAN APLIKASI
Ketika aplikasi dalam mode debug atau profil, perizinan internet akan secara otomatis ditambahkan. Namun ketika Anda ingin menjalankan atu membuatnya dalam mode rilis, Anda perlu menambahkan semua perizinan yang dibutuhkan pada AndroidManifest.

Untuk menambahkan perizinan pada aplikasi Android, Anda bisa menambhakan tag uses-permission pada AndroidManifest, di dalam tag manifest dan sejajar tag application. Contoh:
<uses-permission android:name="android.permission.INTERNET"/>

4. MELAKUKAN BUILD APK

Setelah kita mengatur nama dan ikon aplikasi, langkah selanjutnya adalah melakukan build aplikasi menjadi APK. Sebelumnya terdapat tiga (3) jenis mode aplikasi yang perlu diketahui, yaitu, debug, profile, dan release.

- DEBUG   : Umumnya digunakan untuk pengujian dan penggunaan aplikasi secara internal. Mode debug digunakan secara defaul ketika menjalankan aplikasi menggunakan perintah *flutter run*.
<!-- flutter build apk --debug -->

- RELEASE : Untuk bisa dirilis melaui Google Play Store, Anda perlu membuat APK release.
- PROFILE : Sama hal ya dengan release hanya saja tetap dapat di-debug mengugnakan tools seperto DevTools dan tidak dapat dijalankan di emulator atau simulator.


Untuk bisa mem-build apk release dan mengunggahnya melalu Google Play Store, Anda memerlukan signing key. Signing key ini digunakan sebagai tanda tangan supaya aplikasi Anda lebih aman. Secara defualt Flutter menggunakan debug key sebagai signing key sehingga Anda sebenarnya bisa membuat APK release dengan menjalankan perintah berikut:
<!-- flutter build apk -->

Namun, tentunya akan lebih baik jika Anda menggunakan signing key milik Anda sendiri. Cara untuk membuat signing key dan membuat apk release dapat Anda baca pada tautan dokumentasi berikut: https://flutter.dev/docs/deployment/android.