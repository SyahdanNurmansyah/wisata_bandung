<!-- -------------- BUILD IPA -------------- -->
Catatan: Build .IPA hanya bisa dijalankan dengan mendaftar akun Apple Developer Program. Silakan baca informasi tentang Apple Developer Program di sini https://developer.apple.com/programs/.

Pada materi ini kita akan mempelajari bagaimana melakukan build aplikasi Flutter menjadi berkas .ipa yang dapat dijalankan pada perangkat iOS. Sebelum melakukan build, ada beberapa hal yang perlu kita atur seperti nama dan ikon aplikasi.

1. SETTING NAMA APLIKASI

Untuk mengatur nama aplikasi buka berkas Info.plist pada direktori /ios/Runner/. Konfigurasi untuk nama aplikasi dapat Anda temukan dan ubah pada key Bundle Name
<key>CFBundleName</key>
<string>builder</string>

Atau Anda bisa gunakan library berikut (https://pub.dev/packages/flutter_launcher_name) untuk men-generate nama aplikasi melalui pubspec.yaml.

2. SETTING IKON APLIKASI

Sama seperti perangkat Android, layar untuk perangkat iPhone juga terbagi ke dalam berbagai ukuran. Sehingga diperlukan juga ukuran ikon yang berbeda. Untuk membuat berbagai ukuran ikon untuk iOS, Anda dapat memanfaatkan website seperti https://appicon.co/ atau yang lainnya. Website ini juga bisa digunakan untuk membuat ikon aplikasi Android. Perlu Anda perhatikan bahwa untuk icon pada iOS Anda tidak dapat membuatnya transparant. Alih-alih, Anda harus membuat icon tersebut penuh dengan warna.

Ketika Anda klik Generate, browser akan mengunduh berkas yang Anda butuhkan. Ikon untuk aplikasi iOS bisa Anda dapatkan pada folder Assets.xcassets.

Selanjutnya Anda dapat mengganti folder Assets.xcassets yang ada pada direktori /ios/Runner/ dengan hasil ikon yang sudah Anda generate. Atau Anda bisa menggunakan library berikut untuk men-generate ikon aplikasi melalui pubspec.yaml.

3. MELAKUKAN BUILD IPA

File IPA juga terbagi menjadi debug, profile, dan release. Namun untuk melakukan build aplikasi Flutter menjadi IPA hanya bisa dilakukan pada device macOS. Untuk melakukan build aplikasi menjadi .ipa Anda cukup membuka terminal pada editor atau IDE Anda lalu menjalankan perintah berikut:

<!-- flutter build ios -->

Secara default perintah di atas akan menghasilkan ipa release, sedangkan jika Anda ingin membuat versi debug atau profile, gunakan perintah:

<!-- flutter build ios --debug -->

Namun, bagi Anda yang tidak mempunyai perangkat Apple jangan khawatir, Anda tetap dapat men-deploy project Anda ke iOS menggunakan CI/CD seperti Codemagic dan Bitrise.

