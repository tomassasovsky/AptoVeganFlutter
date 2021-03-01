import '/src/pages/page_selection.dart';
import 'package:aptovegan/src/pages/product_division_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic> routeSettings(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return CupertinoPageRoute(builder: (context) => PageSelection(), settings: settings);
    case 'product_division_page':
      return CupertinoPageRoute(builder: (context) => ProductDivisionPage(), settings: settings);
    default:
      throw UnsupportedError('Unknown route: ${settings.name}');
      return CupertinoPageRoute(builder: (context) => PageSelection(), settings: settings);
  }
}
