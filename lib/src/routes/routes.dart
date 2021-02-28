import 'package:aptovegan/src/pages/product_division_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/src/pages/home_page.dart';

Route<dynamic> routeSettings(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return CupertinoPageRoute(builder: (context) => HomePage(), settings: settings);
    case 'product_division_page':
      return CupertinoPageRoute(builder: (context) => ProductDivisionPage(), settings: settings);
    default:
      throw UnsupportedError('Unknown route: ${settings.name}');
      return CupertinoPageRoute(builder: (context) => HomePage(), settings: settings);
  }
}
