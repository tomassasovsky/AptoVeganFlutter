import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter/services.dart';

import 'package:aptovegan/src/providers/product_genres.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        centerTitle: false,
        title: Text('AptoVegan'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: list(),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _index,
        onTap: (selection) {
          setState(() => _index = selection);
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Products'),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.place),
            title: Text('Places'),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.list),
            title: Text('Additives'),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.add),
            title: Text('Add'),
          ),
        ],
      ),
    );
  }
}
