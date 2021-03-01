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
              'You have no favourites yet! Add a product to \'favourites\' to see it here!',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
