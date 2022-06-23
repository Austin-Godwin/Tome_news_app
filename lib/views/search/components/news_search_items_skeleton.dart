import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../widgets/news_card_skeleton.dart';

class NewSearchItemsSkeleton extends StatelessWidget {
  const NewSearchItemsSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: 10,
          itemBuilder: ((context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.black.withOpacity(0.8),
              highlightColor: Colors.grey.shade500,
              child: const NewsCardSkeleton(),
            );
          })),
    );
  }
}
