import 'package:flutter/material.dart';

import '../../../widgets/skeleton.dart';

class BreakingNewsCardSkeleton extends StatelessWidget {
  const BreakingNewsCardSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: SizedBox(
        width: 215,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Skeleton(
              height: 170,
              width: 215,
              radius: 20.0,
            ),
            const SizedBox(height: 5.0),
            const Skeleton(
              width: 215.0,
              height: 10.0,
              radius: 10.0,
            ),
            const SizedBox(height: 5.0),
            const Skeleton(
              width: 215.0,
              height: 10.0,
              radius: 10.0,
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                const Skeleton(
                  height: 10,
                  width: 60,
                  radius: 10,
                ),
                const SizedBox(width: 5.0),
                CircleAvatar(
                  radius: 2.0,
                  backgroundColor: Colors.black.withOpacity(0.1),
                ),
                const SizedBox(width: 5.0),
                const Skeleton(
                  height: 10,
                  width: 130,
                  radius: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
