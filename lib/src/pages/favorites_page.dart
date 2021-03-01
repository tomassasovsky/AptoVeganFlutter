import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final addFavorites;
  FavoritesPage(this.addFavorites);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.add, color: Theme.of(context).primaryIconTheme.color),
              onPressed: addFavorites,
            ),
            Text(
              'Todavía no tienes ningún favorito! Agrega un producto a \'favoritos\' para verlo aquí!',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
