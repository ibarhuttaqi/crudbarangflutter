import 'package:flutter/material.dart';
import 'data_model.dart';

class EditDataPage extends StatefulWidget {
  final DataModel data;

  EditDataPage({required this.data});

  @override
  _EditDataPageState createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditDataPage> {
  late TextEditingController _kodeController;
  late TextEditingController _namaController;
  late TextEditingController _jumlahController;
  late TextEditingController _hargaController;

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller dengan data yang sudah ada
    _kodeController = TextEditingController(text: widget.data.kodeBarang);
    _namaController = TextEditingController(text: widget.data.namaBarang);
    _jumlahController = TextEditingController(text: widget.data.jumlahBarang.toString());
    _hargaController = TextEditingController(text: widget.data.hargaBarang.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _kodeController,
              decoration: InputDecoration(labelText: 'Kode Barang'),
            ),
            TextField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama Barang'),
            ),
            TextField(
              controller: _jumlahController,
              decoration: InputDecoration(labelText: 'Jumlah Barang'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _hargaController,
              decoration: InputDecoration(labelText: 'Harga Barang'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Mendapatkan nilai baru dari input controllers
          String editedKode = _kodeController.text;
          String editedNama = _namaController.text;
          int editedJumlah = int.parse(_jumlahController.text);
          double editedHarga = double.parse(_hargaController.text);

          // Membuat objek DataModel baru dengan data yang sudah di-edit
          DataModel editedData = DataModel(
            kodeBarang: editedKode,
            namaBarang: editedNama,
            jumlahBarang: editedJumlah,
            hargaBarang: editedHarga,
          );

          // Mengirim objek editedData kembali ke halaman TampilDataPage
          Navigator.pop(context, editedData);
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
