import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: const Color(0xFF43a047),
        accentColor: const Color(0xFF43a047),
        primaryColorBrightness: Brightness.dark,
      ),
      home: new HomePage(),
    );
  }
}

