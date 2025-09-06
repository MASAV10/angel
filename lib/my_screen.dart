import 'package:angel/home_login.dart';
import 'package:angel/open_Options.dart';
import 'package:angel/open_favorites.dart';
import 'package:flutter/material.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SelectableText('My Grid view/Bottom sheet'),
        foregroundColor: Colors.black87,
        backgroundColor: Colors.blueGrey[200],
      ),
      body: Center(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey[100],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 20,
        unselectedFontSize: 16,
        onTap: (value) {
          if (value == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OpenFavorites()),
            );
          } else if (value == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OpenOptions()),
            );
          }else if (value == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeLogin()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            tooltip: 'Favorites',
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.open_with_rounded),
            tooltip: 'Options',
            label: 'Options',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            tooltip: 'Home Login',
            label: 'Home Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            tooltip: 'Music',
            label: 'Music',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place_outlined),
            tooltip: 'Place',
            label: 'Place',
          ),
        ],
      ),
    );
  }

  void openMusic() {}

  void openPlace() {}

  void openHome() {}
}
