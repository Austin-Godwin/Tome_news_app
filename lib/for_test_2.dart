import 'package:flutter/material.dart';

class FavoriteWidget2 extends StatefulWidget {
  final int text;
  final IconData icon;
  const FavoriteWidget2({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  _FavoriteWidget2State createState() => _FavoriteWidget2State();
}

class _FavoriteWidget2State extends State<FavoriteWidget2> {
  // ···
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.icon,
            color: Colors.red,
          ),
          Text('${widget.text}'),
        ],
      )),
    );
  }
}
