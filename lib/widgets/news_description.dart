import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/text.dart';

class NewsDescription extends StatelessWidget {
  final Function() onTap;
  final String topic;
  final String date;
  final String time;
  const NewsDescription({
    Key? key,
    required this.onTap,
    required this.topic,
    required this.date,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0), color: Colors.red),
          child: InkWell(
            onTap: onTap,
            child: AppText.button(
              "visit website",
              // "Entertainment",
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0), color: Colors.red),
          child: AppText.button(
            topic,
            // "Entertainment",
            color: Colors.white,
          ),
        ),
        const Spacer(),
        AppText.body2(
          DateFormat("dd MMM yyyy").format(DateTime.parse(date)),
          // "1st June 2022",
          color: Colors.red.shade900,
        ),
        const SizedBox(width: 5.0),
        CircleAvatar(
          radius: 2.0,
          backgroundColor: Colors.red.shade900,
        ),
        const SizedBox(width: 5.0),
        AppText.body2(
          DateFormat("hh:mm a").format(DateTime.parse(time)),
          // "12:44pm",
          color: Colors.red.shade900,
        ),
      ],
    );
  }
}
