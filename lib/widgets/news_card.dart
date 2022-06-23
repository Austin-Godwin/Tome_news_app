import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tomel_news_app/widgets/skeleton.dart';
import '../utils/text.dart';

class NewsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Function() onPressed;
  const NewsCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          clipBehavior: Clip.hardEdge,
          width: 80,
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 15.0),
        Expanded(
          child: AppText.body1(
            title,
            // "At least 14 killed , including 7\n"
            // "children, after floods in landsides\n"
            // "in Brazil's Rio de Janeiro state.",
            multiText: true,
          ),
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.center,
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(5)),
          child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: onPressed,
              icon: const Icon(
                Icons.chevron_right_rounded,
                size: 18,
                color: Colors.red,
              )),
        ),
      ],
    );
  }
}
