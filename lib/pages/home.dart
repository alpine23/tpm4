import 'package:flutter/material.dart';
import 'package:tugas4tpm/main.dart';
import 'package:tugas4tpm/pages/anggota.dart';
import 'package:tugas4tpm/pages/keliling.dart';
import 'package:tugas4tpm/pages/luas.dart';
import 'package:tugas4tpm/pages/stopwatch.dart';
import 'package:tugas4tpm/pages/prima.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas4tpm/pages/listPage.dart';
import 'package:tugas4tpm/tourism_place.dart';
import 'package:tugas4tpm/pages/session_manager.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageScreen(),
    );
  }
}

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  Future<String> getUsername() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('username') ?? '';
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        stopwatch();
      }
      if (index == 2) {
        tutorial(context);
      }
      if (index == 3) {
        logOut();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page (063||074||079)'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder(
            future: getUsername(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(child: Text('Welcome, ${snapshot.data}')),
                    SizedBox(height: 16),
                    MaterialButton(
                      onPressed: () {
                        anggota();
                      },
                      height: 200,
                      color: Color.fromARGB(255, 155, 226, 248),
                      textColor: Colors.white,
                      child: Text(
                        'Daftar Anggota',
                        style: TextStyle(fontSize: 30.0),
                      ),
                      minWidth: double.infinity,
                    ),
                    MaterialButton(
                      onPressed: () {
                        prima();
                      },
                      height: 200,
                      color: const Color.fromARGB(255, 103, 198, 227),
                      textColor: Colors.white,
                      child: Text(
                        'Bilangan Prima',
                        style: TextStyle(fontSize: 30.0),
                      ),
                      minWidth: double.infinity,
                    ),
                    MaterialButton(
                      onPressed: () {
                        luas();
                      },
                      height: 200,
                      color: const Color.fromARGB(255, 55, 140, 231),
                      textColor: Colors.white,
                      child: Text(
                        'Penghitung Luas',
                        style: TextStyle(fontSize: 30.0),
                      ),
                      minWidth: double.infinity,
                    ),
                    MaterialButton(
                      onPressed: () {
                        keliling();
                      },
                      height: 200,
                      color: const Color.fromARGB(255, 83, 86, 255),
                      textColor: Colors.white,
                      child: Text(
                        'Keliling Segitiga',
                        style: TextStyle(fontSize: 30.0),
                      ),
                      minWidth: double.infinity,
                    ),
                    MaterialButton(
                      onPressed: () {
                        listpage();
                      },
                      height: 200,
                      color: Color.fromARGB(255, 34, 36, 105),
                      textColor: Colors.white,
                      child: Text(
                        'Sistem Rekomendasi',
                        style: TextStyle(fontSize: 30.0),
                      ),
                      minWidth: double.infinity,
                    ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Stopwatch',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: 'Tutorial',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout_rounded),
            label: 'Logout',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        onTap: _onItemTapped,
      ),
    );
  }

  void tutorial(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text(
            'Daftar Anggota: Anda dapat melihat informasi detail anggota.                 Aplikasi Menampilkan Bilangan Prima: Masukkan bilangan dan tekan "Cek" untuk mengetahui hasilnya bilangan prima atau bukan.                             Aplikasi Pengitung Luas dan Keliling Segitiga: Masukkan nilai alas dan tinggi segitiga, lalu tekan "Hitung" untuk melihat luas dan kelilingnya.                             Daftar Situs Rekomendasi: Jelajahi situs web yang direkomendasikan dengan klik link yang tersedia.'),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          )
        ],
      ),
    );
  }

  void logOut() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }

  void anggota() {  
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Anggota()),
    );
  }

  void prima() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Prima()),
    );
  }

  void luas() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Luas()),
    );
  }

  void keliling() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Keliling()),
    );
  }

  void listpage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen()),
    );
  }

  void stopwatch() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Stopwatch()),
    );
  }
}
