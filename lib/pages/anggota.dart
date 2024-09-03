import 'package:flutter/material.dart';
import 'package:tugas4tpm/main.dart';
import 'package:tugas4tpm/pages/home.dart';

class Anggota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnggotaScreen(),
    );
  }
}

class AnggotaScreen extends StatefulWidget {
  @override
  _AnggotaScreenState createState() => _AnggotaScreenState();
}

class _AnggotaScreenState extends State<AnggotaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: homePage,
        ),
        title: Text('Daftar Anggota'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: logOut,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  Container(
                    width: 200,
                    height: 100,
                    color: Colors.lightBlueAccent,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Daniel Hansel Christiawan',
                              style: TextStyle(color: Colors.white)),
                          Text('123210063',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 100,
                    color: Colors.lightBlueAccent,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Zulfians Adnan',
                              style: TextStyle(color: Colors.white)),
                          Text('123210074',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 100,
                    color: Colors.lightBlueAccent,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Alfin Shalahuddin Ahmad',
                              style: TextStyle(color: Colors.white)),
                          Text('123210079',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void logOut() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }

  void homePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}
