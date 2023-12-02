import 'package:flutter/material.dart';

class TentangAplikasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tentang Aplikasi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Aplikasi CRUD Data Barang',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Versi 1.0',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Aplikasi Pendataan Barang\n"
              "Selamat datang di Aplikasi Pendataan Barang! Aplikasi ini dirancang untuk memudahkan pengguna dalam melakukan manajemen data barang, termasuk penambahan data baru, penampilan data yang sudah tersimpan, dan informasi mengenai aplikasi ini.\n"
              "\n"
              "Fitur Utama:\n"
              "- Tambahkan data barang dengan mudah melalui halaman input.\n"
              "- Lihat daftar lengkap data barang yang sudah tersimpan.\n"
              "- Edit data barang untuk pembaruan informasi.\n"
              "- Akses menu 'Tentang Aplikasi' untuk informasi lebih lanjut.\n"
              "\n"
              "Aplikasi ini dikembangkan dengan menggunakan teknologi Flutter, sehingga dapat dijalankan dengan mulus di berbagai platform seperti Android, iOS, dan web. Kami berharap Aplikasi Pendataan Barang ini dapat memenuhi kebutuhan Anda dalam mengelola data barang dengan efisien.\n"
              "\n"
              "Terima kasih telah menggunakan Aplikasi Pendataan Barang. Jika Anda memiliki pertanyaan atau masukan, jangan ragu untuk menghubungi kami.\n"
              ,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            // Tambahkan informasi atau deskripsi tambahan sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}
