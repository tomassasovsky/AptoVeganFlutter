import 'package:flutter/material.dart';

import '/src/pages/home_page.dart';
import '/src/routes/routes.dart' as routes;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(appBarTheme: AppBarTheme(backgroundColor: Color(0xff222222))),
      darkTheme: ThemeData.dark().copyWith(appBarTheme: AppBarTheme(backgroundColor: Color(0xff222222))),
      home: HomePage(),
      onGenerateRoute: routes.routeSettings,
    );
  }
}
