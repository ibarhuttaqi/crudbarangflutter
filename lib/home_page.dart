import 'package:flutter/material.dart';
import 'second_page.dart';
import 'input_page.dart';
import 'tampil_data_page.dart';
import 'tentang_aplikasi_page.dart';
import 'data_model.dart';



class HomePage extends StatefulWidget {
  final List<DataModel> dataList; // Tambahkan properti dataList

  // Konstruktor untuk menginisialisasi dataList
  HomePage({required this.dataList});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // Tambahkan getter untuk mendapatkan dataList dari widget
  List<DataModel> get dataList => widget.dataList;

  @override
  void initState() {
    super.initState();

    // Membuat controller animasi dan tween
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Menjalankan animasi secara berulang
    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Aplikasi Input Barang',
          style: TextStyle(
            fontSize: 20 * _animation.value,
            color: Colors.black87,
            fontFamily: 'playpen',
            shadows: [
              Shadow(
                blurRadius: 5.0,
                color: Colors.white,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.lightBlue.shade200], // Ganti dengan warna yang diinginkan
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // begin: Alignment.topLeft,
              // end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return GestureDetector(
            onTap: () {
              // Navigasi ke Halaman Kedua saat layar diklik
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(dataList: dataList),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 255, 245, 194), Colors.lightBlue.shade400],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Text(
                    'Klik di mana saja untuk memulai',
                    style: TextStyle(
                      fontSize: 20 * _animation.value,
                      color: Colors.white,
                      fontFamily: 'playpen',
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}



// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       body: GestureDetector(
//         onTap: () {
//           // Navigasi ke Halaman Kedua saat layar diklik
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => SecondPage(),
//             ),
//           );
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.blue.shade300, Colors.purple.shade400],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//           child: Center(
//             child: Text(
//               'Klik di mana saja untuk ke Halaman Kedua',
//               style: TextStyle(fontSize: 20, color: Colors.white),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
