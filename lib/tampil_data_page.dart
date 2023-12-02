import 'package:flutter/material.dart';
import 'data_model.dart';
import 'edit_data_page.dart';

class TampilDataPage extends StatefulWidget {
  final List<DataModel> dataList; // Tambahkan properti dataList

  TampilDataPage({required this.dataList});

  @override
  _TampilDataPageState createState() => _TampilDataPageState();
}

class _TampilDataPageState extends State<TampilDataPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Tampil Data'),
      ),
      body: ListView.builder(
        itemCount: widget.dataList.length,
        itemBuilder: (context, index) {
          DataModel data = widget.dataList[index];
          return ListTile(
            title: Text('${data.kodeBarang} - ${data.namaBarang}'),
            subtitle: Text('Jumlah: ${data.jumlahBarang}, Harga: ${data.hargaBarang}'),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () async {
                DataModel? editedData = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditDataPage(data: data),
                  ),
                );

                if (editedData != null) {
                  setState(() {
                    widget.dataList[index] = editedData;
                  });

                  // Menampilkan pesan pemberitahuan ketika data berhasil diubah
                  _showSuccessSnackBar(context, 'Data berhasil diubah!');
                }
              },
            ),
          );
        },
      ),
    );
  }

  void _showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}


