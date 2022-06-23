import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../widgets/skeleton.dart';

class TrendingNewsCardSkeleton extends StatelessWidget {
  const TrendingNewsCardSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(left: 15),
      width: 215,
      // height: 280,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20.0)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Positioned(
          //   top: 10,
          //   right: 10,
          //   child: Container(
          //     // width: 100,
          //     // height: 30,
          //     padding: const EdgeInsets.symmetric(
          //       horizontal: 10,
          //       vertical: 5,
          //     ),
          //     decoration: BoxDecoration(
          //       color: Colors.white.withOpacity(0.5),
          //       borderRadius:
          //           BorderRadius.circular(50),
          //     ),
          //     child: AppText.button(
          //       "Live Update",
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          Positioned(
            bottom: 0,
            child: Container(
              alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,
              width: 215,
              height: 90,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Column(children: const [
                  SizedBox(height: 25.0),
                  Skeleton(
                    width: 200.0,
                    height: 10.0,
                    radius: 10.0,
                  ),
                  SizedBox(height: 5.0),
                  Skeleton(
                    width: 200.0,
                    height: 10.0,
                    radius: 10.0,
                  ),
                  SizedBox(height: 5.0),
                  Skeleton(
                    width: 150.0,
                    height: 10.0,
                    radius: 10.0,
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
