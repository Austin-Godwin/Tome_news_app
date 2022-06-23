import 'package:flutter/material.dart';

import 'skeleton.dart';

class NewsCardSkeleton extends StatelessWidget {
  const NewsCardSkeleton({
    Key? key,
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
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        const SizedBox(width: 15.0),
        Expanded(
          child: Column(
            children: const [
              Skeleton(
                width: 230.0,
                height: 10.0,
                radius: 10.0,
              ),
              SizedBox(height: 5.0),
              Skeleton(
                width: 230.0,
                height: 10.0,
                radius: 10.0,
              ),
              SizedBox(height: 5.0),
              Skeleton(
                width: 200.0,
                height: 10.0,
                radius: 10.0,
              ),
            ],
          ),
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.center,
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black.withOpacity(0.1),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(5)),
          child: Icon(
            Icons.chevron_right_rounded,
            size: 18,
            color: Colors.black.withOpacity(0.1),
          ),
        ),
      ],
    );
  }
}
