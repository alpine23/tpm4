import 'package:flutter/material.dart';
import 'package:tugas4tpm/pages/favoritePage.dart';
import 'package:tugas4tpm/pages/home.dart';
import 'package:tugas4tpm/tourism_place.dart';
import 'package:tugas4tpm/pages/detailPage.dart';
import 'package:tugas4tpm/pages/favoritePage.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman List"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => _logOut(context), // Perbaikan disini
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final TourismPlace place = tourismPlaceList[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(place: place),
                  ));
            },
            child: Card(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.network(place.imageUrls[0]),
                  ),
                  Text(place.name)
                ],
              ),
            ),
          );
        },
        itemCount: tourismPlaceList.length,
      ),
    );
  }

  void _logOut(BuildContext context) {
    // Perbaikan disini
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}
