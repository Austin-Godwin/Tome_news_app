import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/api.dart';
import '../utils/text.dart';

class AuthorProfile extends StatelessWidget {
  // final String imageUrl;
  final String? author;
  final String rights;
  const AuthorProfile(
      {Key? key,
      // required this.imageUrl,
      required this.author,
      required this.rights})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 15.0,
          backgroundImage: CachedNetworkImageProvider(
            Api.noProfileImage,
            // "https://images.pexels.com/photos/4571943/pexels-photo-4571943.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(child: AppText.caption("By $author, $rights"))
      ],
    );
  }
}
