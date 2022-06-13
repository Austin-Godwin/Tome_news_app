import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tomel_news_app/constants/api.dart';
import 'package:tomel_news_app/views/home_view/components/breaking_news_card.dart';
import 'package:tomel_news_app/views/home_view/components/trending_news_card.dart';
import 'package:tomel_news_app/views/home_view/components/trending_news_items.dart';
import '../../utils/all_methods.dart';
import '../../utils/text.dart';
import '../main_news_view.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsHomeView extends StatefulWidget {
  const NewsHomeView({Key? key}) : super(key: key);

  @override
  State<NewsHomeView> createState() => _NewsHomeViewState();
}

class _NewsHomeViewState extends State<NewsHomeView> {
  final allMethods = AllMethods();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      allMethods.getTrendingNews(
          context: context,
          toSetState: () {
            setState(() {});
          });
    });
    Future.delayed(const Duration(seconds: 3), () {
      allMethods.getBreakingNews(
          context: context,
          toSetState: () {
            setState(() {});
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50.0),
          // AppText.heading1("Tomel News"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Image.asset(
              "assets/tomel_news_logo_1.png",
              width: 200.0,
            ),
          ),
          const SizedBox(height: 15.0),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: AppText.heading1(
                    "News of the Day",
                  ),
                ),
                const SizedBox(height: 22.0),
                Container(
                  // padding: EdgeInsets.only(left: 10),
                  height: MediaQuery.of(context).size.height / 3,
                  child: allMethods.trendingNews.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : TrendingNewsItems(
                          trendingNews: allMethods.trendingNews),
                ),
                const SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: AppText.heading1(
                    "Breaking News",
                  ),
                ),
                const SizedBox(height: 22.0),
                Container(
                  // padding: EdgeInsets.only(left: 10),
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: allMethods.breakingNews.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.only(left: 5, right: 20),
                          scrollDirection: Axis.horizontal,
                          itemCount: allMethods.breakingNews.length,
                          itemBuilder: ((context, index) {
                            return BreakingNewsCard(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => MainNewsView(
                                          imageUrl: allMethods
                                                          .breakingNews[index]
                                                      ["media"] ==
                                                  ""
                                              ? Api.noImage
                                              : allMethods.breakingNews[index]
                                                      ["media"] ??
                                                  Api.noImage,
                                          topic: allMethods.breakingNews[index]
                                              ["topic"],
                                          newsDate:
                                              allMethods.breakingNews[index]
                                                  ["published_date"],
                                          newsTime:
                                              allMethods.breakingNews[index]
                                                  ["published_date"],
                                          title: allMethods.breakingNews[index]
                                              ["title"],
                                          author: allMethods.breakingNews[index]
                                                      ["author"] ==
                                                  ""
                                              ? "Annonymous"
                                              : allMethods.breakingNews[index]
                                                      ["author"] ??
                                                  "Annonymous",
                                          rights: allMethods.breakingNews[index]
                                              ["rights"],
                                          summary: allMethods
                                              .breakingNews[index]["summary"],
                                        )),
                                  ),
                                );
                              },
                              imageUrl:
                                  allMethods.breakingNews[index]["media"] == ""
                                      ? Api.noImage
                                      : allMethods.breakingNews[index]["media"]
                                              .contains("?p=twitter")
                                          ? Api.noImage
                                          : allMethods.breakingNews[index]
                                                  ["media"] ??
                                              Api.noImage,
                              title: allMethods.breakingNews[index]["title"],
                              time: timeago.format(
                                DateTime.parse(
                                  allMethods.breakingNews[index]
                                      ["published_date"],
                                ),
                              ),
                              author:
                                  "By ${allMethods.breakingNews[index]["author"] == "" ? "Annonymous" : allMethods.breakingNews[index]["author"] ?? "Annonymous"}",
                            );
                          }),
                        ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
