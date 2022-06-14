import 'package:flutter/material.dart';
import '../../../utils/text.dart';

class TabCard extends StatelessWidget {
  final Color tabColor;
  final Function() onTap;
  final String text;
  final Color textColor;
  const TabCard({
    Key? key,
    required this.tabColor,
    required this.onTap,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 135,
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: tabColor,
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(
          color: Colors.red,
          width: 2.0,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: AppText.body1(
          text,
          color: textColor,
        ),
      ),
    );
  }
}
