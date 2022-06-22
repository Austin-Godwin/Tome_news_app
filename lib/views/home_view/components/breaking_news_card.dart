import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../utils/text.dart';

class BreakingNewsCard extends StatelessWidget {
  final Function() onTap;
  final String imageUrl;
  final String title;
  final String time;
  final String author;
  const BreakingNewsCard({
    Key? key,
    required this.onTap,
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 215,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170,
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.only(left: 15),
              width: 215,
              // height: 150,
              decoration: BoxDecoration(
                  color: const Color(0xFF2A2428),
                  borderRadius: BorderRadius.circular(20.0)),
              child: CachedNetworkImage(
                width: MediaQuery.of(context).size.width,
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SizedBox(
                width: 215,
                height: 60,
                child: AppText.body1(
                  title,
                  // "China economy hit by\ndouble whammy in march",
                  multiText: true,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  AppText.body2(
                    time,
                    color: Colors.red.shade900,
                  ),
                  const SizedBox(width: 5.0),
                  CircleAvatar(
                    radius: 2.0,
                    backgroundColor: Colors.red.shade900,
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: AppText.body2(
                      author,
                      color: Colors.red.shade900,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
