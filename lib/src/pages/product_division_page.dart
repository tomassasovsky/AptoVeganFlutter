import 'package:flutter/material.dart';

class ProductDivisionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map element = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('AptoVegan'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            color: Color(int.tryParse(element['tile_color'])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeInImage(
                  height: 100,
                  width: 100,
                  placeholder: AssetImage('assets/app_icon.png'),
                  image: AssetImage('assets/app_icon.png'),
                ),
                Text(
                  element['product_type'],
                  style: TextStyle(fontSize: 26),
                ),
                if (element['description'] != null)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                    child: Text(
                      element['description'],
                      textAlign: TextAlign.start,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
