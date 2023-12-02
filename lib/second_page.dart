import 'package:flutter/material.dart';
import 'home_page.dart';
import 'input_page.dart';
import 'tampil_data_page.dart';
import 'tentang_aplikasi_page.dart';
import 'data_model.dart';

class SecondPage extends StatelessWidget {

  final List<DataModel> dataList; // Tambahkan properti dataList

  // Konstruktor untuk menginisialisasi dataList
  SecondPage({required this.dataList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Kembali ke halaman utama (home page)
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(dataList: dataList),
              ),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: 3, // Ubah sesuai dengan jumlah menu yang Anda miliki
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              onTap: () {
                switch (index) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InputPage()),
                    );
                    break;
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TampilDataPage(dataList: dataList),
                      ),
                    );
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TentangAplikasiPage(),
                      ),
                    );
                    break;
                  default:
                    break;
                }
              },
              title: Text(getMenuTitle(index)), // Fungsi untuk mendapatkan judul menu
            ),
          );
        },
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Menu'),
    //   ),
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       ElevatedButton(
    //         onPressed: () {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => InputPage()),
    //           );
    //         },
    //         child: Text('Pergi ke Halaman Input'),
    //       ),
    //       ElevatedButton(
    //         onPressed: () {
    //           // Logika untuk menavigasi ke halaman tampil data
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => TampilDataPage(dataList: dataList),
    //             ),
    //           );
    //         },
    //         child: Text('Tampilkan Data'),
    //       ),
    //       SizedBox(height: 16), // Jarak antara dua tombol
    //       ElevatedButton(
    //         onPressed: () {
    //           // Logika untuk menavigasi ke halaman tentang aplikasi
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => TentangAplikasiPage(),
    //             ),
    //           );
    //         },
    //         child: Text('Tentang Aplikasi'),
    //       ),
    //     ],
    //   ),
    // );
  }


  String getMenuTitle(int index) {
    switch (index) {
      case 0:
        return 'Halaman Input';
      case 1:
        return 'Tampilkan Data';
      case 2:
        return 'Tentang Aplikasi';
      default:
        return '';
    }
  }
}
