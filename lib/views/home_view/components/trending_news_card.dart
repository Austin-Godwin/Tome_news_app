import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../utils/text.dart';

class TrendingNewsCard extends StatelessWidget {
  final Function() onTap;
  final String imageUrl;
  final String title;
  const TrendingNewsCard({
    Key? key,
    required this.onTap,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(left: 15),
      width: 215,
      // height: 280,
      decoration: BoxDecoration(
          color: const Color(0xFF2A2428),
          borderRadius: BorderRadius.circular(20.0)),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CachedNetworkImage(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              imageUrl: imageUrl,
              // "https://images.pexels.com/photos/1687093/pexels-photo-1687093.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              fit: BoxFit.cover,
            ),
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
                  child: AppText.body1(
                    title,
                    centered: true,
                    color: Colors.white,
                    multiText: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
