import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:tomel_news_app/views/home_view/components/breaking_news_card_skeleton.dart';
import '../../../constants/api.dart';
// import '../../../utils/all_methods.dart';
import '../../main_news_view.dart';
import 'breaking_news_card.dart';

class BreakingNewsItems extends StatelessWidget {
  final List<Map<String, dynamic>> breakingNews;
  const BreakingNewsItems({Key? key, required this.breakingNews})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 5, right: 20),
      scrollDirection: Axis.horizontal,
      itemCount: breakingNews.isEmpty ? 5 : breakingNews.length,
      itemBuilder: ((context, index) {
        return breakingNews.isEmpty
            ? Shimmer.fromColors(
                baseColor: Colors.black.withOpacity(0.8),
                highlightColor: Colors.grey.shade500,
                child: const BreakingNewsCardSkeleton(),
              )
            : BreakingNewsCard(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => MainNewsView(
                            imageUrl: breakingNews[index]["media"] == ""
                                ? Api.noImage
                                : breakingNews[index]["media"] ?? Api.noImage,
                            link: breakingNews[index]["link"],
                            topic: breakingNews[index]["topic"],
                            newsDate: breakingNews[index]["published_date"],
                            newsTime: breakingNews[index]["published_date"],
                            title: breakingNews[index]["title"],
                            // icon: AllMethods.onClicked
                            //       ? Icons.bookmark_add_rounded
                            //       : Icons.bookmark_add_outlined,
                            author: breakingNews[index]["author"] == ""
                                ? "Annonymous"
                                : breakingNews[index]["author"] ?? "Annonymous",
                            rights: breakingNews[index]["rights"],
                            summary: breakingNews[index]["summary"],
                          )),
                    ),
                  );
                },
                imageUrl: breakingNews[index]["media"] == ""
                    ? Api.noImage
                    : breakingNews[index]["media"].contains("?p=twitter")
                        ? Api.noImage
                        : breakingNews[index]["media"] ?? Api.noImage,
                title: breakingNews[index]["title"],
                time: timeago.format(
                  DateTime.parse(
                    breakingNews[index]["published_date"],
                  ),
                ),
                author:
                    "By ${breakingNews[index]["author"] == "" ? "Annonymous" : breakingNews[index]["author"] ?? "Annonymous"}",
              );
      }),
    );
  }
}
