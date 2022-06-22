import 'package:flutter/material.dart';
// import 'package:tomel_news_app/utils/all_methods.dart';
import '../../../constants/api.dart';
import '../../main_news_view.dart';
import 'trending_news_card.dart';

class TrendingNewsItems extends StatelessWidget {
  final List<Map<String, dynamic>> trendingNews;
  const TrendingNewsItems({
    Key? key,
    required this.trendingNews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 5, right: 20),
      scrollDirection: Axis.horizontal,
      itemCount: trendingNews.length,
      itemBuilder: ((context, index) {
        return TrendingNewsCard(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => MainNewsView(
                      imageUrl: trendingNews[index]["media"] == ""
                          ? Api.noImage
                          : trendingNews[index]["media"] ?? Api.noImage,
                      topic: trendingNews[index]["topic"],
                      newsDate: trendingNews[index]["published_date"],
                      newsTime: trendingNews[index]["published_date"],
                      title: trendingNews[index]["title"],
                      // icon: AllMethods.onClicked
                      //     ? Icons.bookmark_add_rounded
                      //     : Icons.bookmark_add_outlined,
                      author: trendingNews[index]["author"] == ""
                          ? "Annonymous"
                          : trendingNews[index]["author"] ?? "Annonymous",
                      rights: trendingNews[index]["rights"],
                      summary: trendingNews[index]["summary"],
                    )),
              ),
            );
          },
          imageUrl: trendingNews[index]["media"] == ""
              ? Api.noImage
              : trendingNews[index]["media"] ?? Api.noImage,
          title: trendingNews[index]["title"],
        );
      }),
    );
  }
}
