import 'package:flutter/material.dart';
import 'package:tomel_news_app/for_test.dart';
import 'package:tomel_news_app/utils/theme.dart';
import 'package:tomel_news_app/views/home_view.dart';

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
