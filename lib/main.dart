import 'package:flutter/material.dart';
import 'views/home_view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final theme = TomelNewTheme.dark();
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          // theme,
          ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}
