import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50.0),
        // AppText.heading1("Tomel News"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Image.asset(
            "assets/tomel_news_logo_1.png",
            width: 200.0,
          ),
        ),
        const SizedBox(height: 15.0)
      ],
    );
  }
}
