import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:tugas4tpm/main.dart';
import 'package:tugas4tpm/pages/home.dart';

class Prima extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bilangan Prima',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GanjilGenapScreen(),
    );
  }
}

class GanjilGenapScreen extends StatefulWidget {
  @override
  _GanjilGenapScreenState createState() => _GanjilGenapScreenState();
}

class _GanjilGenapScreenState extends State<GanjilGenapScreen> {
  TextEditingController _num1Controller = TextEditingController();
  TextEditingController _num2Controller = TextEditingController();
  List<String> results = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: _homePage,
        ),
        title: const Text('Bilangan Prima'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logOut,
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'assets/angka.jpeg',
                  height: 200,
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: _num1Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Masukkan bilangan awal',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: _num2Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Masukkan bilangan akhir',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MaterialButton(
                    onPressed: _check,
                    color: Colors.blue,
                    child: const Text(
                      'Check Bilangan Prima',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Expanded(
                  child: ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          results[index],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool isPrime(int n) {
    if (n <= 1) return false;
    for (int i = 2; i <= n / 2; ++i) {
      if (n % i == 0) {
        return false;
      }
    }
    return true;
  }

  void displayPrimes(double start, double end) {
    List<String> primeNumbers = [];
    primeNumbers.add('Bilangan prima antara $start dan $end:');
    for (int i = start.toInt(); i <= end.toInt(); ++i) {
      if (isPrime(i)) {
        primeNumbers.add('$i');
      }
    }
    setState(() {
      results = primeNumbers;
    });
  }

  void _check() {
    double start = double.tryParse(_num1Controller.text) ?? 0;
    double end = double.tryParse(_num2Controller.text) ?? 0;
    displayPrimes(start, end);
  }

  void _logOut() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyApp()),
    );
  }

  void _homePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}
