import 'package:flutter/material.dart';
import 'package:tugas4tpm/pages/favoritePage.dart';
import 'package:tugas4tpm/tourism_place.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final TourismPlace place;
  const DetailScreen({Key? key, required this.place}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isFavorite = false;
  @override
  void initState() {
    super.initState();
    _isFavorite = widget.place.isFavorite;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.place.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.bookmarks_rounded),
            onPressed: _navigateToFavoritePage,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            child: Image.network(widget.place.imageUrls[0]),
          ),
          Text(
            widget.place.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Text(widget.place.description),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isFavorite = !_isFavorite;
            widget.place.isFavorite = _isFavorite;
          });
        },
        child: _isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
      ),
    );
  }

  Future<void> _launchedURrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not Launch $_url');
    }
    await launch(_url.toString());
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });

    // Find the corresponding TourismPlace object in the tourismPlaceList
    final index =
        tourismPlaceList.indexWhere((place) => place.name == widget.place.name);
    if (index != -1) {
      // Update the isFavorite property of the TourismPlace object
      tourismPlaceList[index].updateFavoriteStatus(_isFavorite);
    }
  }

  void _navigateToFavoritePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FavoritePage(
            favoritePlaces:
                tourismPlaceList.where((place) => place.isFavorite).toList()),
      ),
    );
  }
}
