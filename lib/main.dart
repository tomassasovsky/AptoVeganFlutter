import 'package:aptovegan/src/pages/page_selection.dart';
import 'package:flutter/material.dart';
import '/src/routes/routes.dart' as routes;
import '/src/themes/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: PageSelection(),
      onGenerateRoute: routes.routeSettings,
    );
  }
}
