import 'package:flutter/material.dart';

import 'for_test_2.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  // ···
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              child: IconButton(
                padding: const EdgeInsets.all(0),
                alignment: Alignment.centerRight,
                icon: (_isFavorited
                    ? const Icon(Icons.star)
                    : const Icon(Icons.star_border)),
                color: Colors.red[500],
                onPressed: _toggleFavorite,
              ),
            ),
            SizedBox(
              width: 18,
              child: SizedBox(
                child: Text('$_favoriteCount'),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavoriteWidget2(
                                text: _favoriteCount,
                                icon: _isFavorited
                                    ? Icons.star
                                    : Icons.star_border,
                              )));
                },
                icon: Icon(Icons.chevron_right_rounded))
          ],
        ),
      ),
    );
  }
}
