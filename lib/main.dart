import 'package:flutter/material.dart';
import 'home_page.dart';
import 'data_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<DataModel> dataList = []; // Ganti ini dengan data yang sesuai
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Submission Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(dataList: dataList),
    );
  }
}
