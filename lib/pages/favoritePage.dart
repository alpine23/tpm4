import 'package:flutter/material.dart';
import 'package:tugas4tpm/pages/detailPage.dart';
import 'package:tugas4tpm/tourism_place.dart';

class FavoritePage extends StatelessWidget {
  final List<TourismPlace> favoritePlaces;

  const FavoritePage({Key? key, required this.favoritePlaces})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Places'),
      ),
      body: ListView.builder(
        itemCount: favoritePlaces.length,
        itemBuilder: (context, index) {
          final place = favoritePlaces[index];
          return ListTile(
            leading: Image.network(place.imageUrls[0]),
            title: Text(place.name),
            subtitle: Text(place.location),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(place: place),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
