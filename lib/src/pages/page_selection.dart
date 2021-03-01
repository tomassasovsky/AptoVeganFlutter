import 'package:aptovegan/src/pages/add_page.dart';
import 'package:aptovegan/src/pages/additives_page.dart';
import 'package:aptovegan/src/pages/favorites_page.dart';
import 'package:aptovegan/src/pages/places_page.dart';
import 'package:aptovegan/src/pages/products_page.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter/services.dart';

class PageSelection extends StatefulWidget {
  @override
  _PageSelectionState createState() => _PageSelectionState();
}

class _PageSelectionState extends State<PageSelection> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Image(
                      image: AssetImage('assets/drawer_image.jpg'),
                    ),
                    Positioned(
                      left: 20,
                      top: 20,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/profile_picture.jpg'),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Favoritos'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Future.delayed(Duration(milliseconds: 200)).then((_) {
                      if (_index != 1) setState(() => _index = 1);
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Configuración'),
                ),
              ],
            ),
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.nights_stay),
                onPressed: () {},
              ),
              trailing: IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
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
      body: IndexedStack(
        index: _index,
        children: [
          ProductsPage(),
          FavoritesPage(() => setState(() => _index = 0)),
          PlacesPage(),
          AdditivesPage(),
          AddPage(),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _index,
        onTap: (selection) {
          if (selection != _index) setState(() => _index = selection);
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Productos'),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favoritos'),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.place),
            title: Text('Lugares'),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.list),
            title: Text('Aditivos'),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.add),
            title: Text('Agregar'),
          ),
        ],
      ),
    );
  }
}
