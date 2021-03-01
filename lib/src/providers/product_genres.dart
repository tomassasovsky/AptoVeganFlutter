import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _ProductsProvider {
  List<dynamic> options = [];

  _ProductsProvider() {
    loadData();
  }

  Future<List<dynamic>> loadData() async {
    final response = await rootBundle.loadString('data/product_divisions.json');

    Map dataMap = json.decode(response);
    options = dataMap['divisions'];

    return options;
  }
}

final productsProvider = _ProductsProvider();

list() {
  return FutureBuilder(
    future: productsProvider.loadData(),
    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 3),
          physics: BouncingScrollPhysics(),
          children: _listItems(snapshot.data, context),
        );
      }
      return Center(child: CircularProgressIndicator());
    },
  );
}

List<Widget> _listItems(List<dynamic> data, BuildContext context) {
  final divider = Divider(height: 5, thickness: 0, color: Colors.transparent);
  final List<Widget> options = [
    divider,
  ];

  data.forEach((element) {
    Color tileColor = Color(int.tryParse(element['tile_color']));
    String product = element['product_type'];
    TextStyle textStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xfffafafa));

    final wTemp = GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('product_division_page', arguments: element);
      },
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: tileColor,
        ),
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ListTile(
            tileColor: tileColor,
            leading: Icon(
              Icons.ac_unit,
            ),
            minLeadingWidth: 24,
            title: Text(
              product,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
    options..add(wTemp)..add(divider);
  });

  return options;
}
