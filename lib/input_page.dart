import 'package:flutter/material.dart';
import 'data_model.dart';
import 'tampil_data_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  List<DataModel> dataList = []; // List untuk menyimpan data

  String kodeBarang = "";
  String namaBarang = "";
  int jumlahBarang = 0;
  double hargaBarang = 0.0;

  Future<void> _showNotification() async {
    // Menampilkan pesan pemberitahuan (SnackBar) ketika data berhasil disimpan
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Data berhasil disimpan!'),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ... (input fields)
            TextField(
              onChanged: (value) {
                setState(() {
                  kodeBarang = value;
                });
              },
              decoration: InputDecoration(labelText: 'Kode Barang'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  namaBarang = value;
                });
              },
              decoration: InputDecoration(labelText: 'Nama Barang'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  jumlahBarang = int.parse(value);
                });
              },
              decoration: InputDecoration(labelText: 'Jumlah Barang'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  hargaBarang = double.parse(value);
                });
              },
              decoration: InputDecoration(labelText: 'Harga Barang'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 20),
            Text(
              'Input Pengguna: $kodeBarang, $namaBarang, $jumlahBarang, $hargaBarang',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Membuat objek DataModel dari inputan
                DataModel data = DataModel(
                  kodeBarang: kodeBarang,
                  namaBarang: namaBarang,
                  jumlahBarang: jumlahBarang,
                  hargaBarang: hargaBarang,
                );

                // Menambahkan data ke dalam list
                setState(() {
                  dataList.add(data);
                });

                // Membersihkan input fields
                setState(() {
                  kodeBarang = "";
                  namaBarang = "";
                  jumlahBarang = 0;
                  hargaBarang = 0.0;
                });
                _showNotification();
              },
              child: Text('Simpan Data'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman TampilDataPage dengan membawa dataList sebagai parameter
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TampilDataPage(dataList: dataList),
                  ),
                );
              },
              child: Text('Tampil Data'),
            ),
          ],
        ),
      ),
    );
  }
}