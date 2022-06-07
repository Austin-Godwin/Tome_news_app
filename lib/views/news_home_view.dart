import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tomel_news_app/constants/api.dart';

import '../utils/all_methods.dart';
import '../utils/text.dart';
import 'main_news_view.dart';
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
    Future.delayed(const Duration(seconds: 2), () {
      allMethods.getTrendingNews(toSetState: () {
        setState(() {});
      });
    });
    Future.delayed(const Duration(seconds: 5), () {
      allMethods.getBreakingNews(toSetState: () {
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
                      : ListView.builder(
                          padding: const EdgeInsets.only(left: 5, right: 20),
                          scrollDirection: Axis.horizontal,
                          itemCount: allMethods.trendingNews.length,
                          itemBuilder: ((context, index) {
                            return Container(
                              clipBehavior: Clip.hardEdge,
                              margin: const EdgeInsets.only(left: 15),
                              width: 215,
                              // height: 150,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF2A2428),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => MainNewsView(
                                            imageUrl: allMethods
                                                            .trendingNews[index]
                                                        ["media"] ==
                                                    ""
                                                ? Api.noImage
                                                : allMethods.trendingNews[index]
                                                        ["media"] ??
                                                    Api.noImage,
                                            topic: allMethods
                                                .trendingNews[index]["topic"],
                                            newsDate:
                                                allMethods.trendingNews[index]
                                                    ["published_date"],
                                            newsTime:
                                                allMethods.trendingNews[index]
                                                    ["published_date"],
                                            title: allMethods
                                                .trendingNews[index]["title"],
                                            author: allMethods
                                                            .trendingNews[index]
                                                        ["author"] ==
                                                    ""
                                                ? "Annonymous"
                                                : allMethods.trendingNews[index]
                                                        ["author"] ??
                                                    "Annonymous",
                                            rights: allMethods
                                                .trendingNews[index]["rights"],
                                            summary: allMethods
                                                .trendingNews[index]["summary"],
                                          )),
                                    ),
                                  );
                                },
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    // allMethods.everyNews[index]["media"] == null
                                    //     ? const Center(
                                    //         child: Icon(
                                    //           Icons.accessible_forward_sharp,
                                    //           color: Colors.white,
                                    //         ),
                                    //       )
                                    //     :
                                    CachedNetworkImage(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      imageUrl: allMethods.trendingNews[index]
                                                  ["media"] ==
                                              ""
                                          ? Api.noImage
                                          : allMethods.trendingNews[index]
                                                  ["media"] ??
                                              Api.noImage,
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
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.5)),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 5, sigmaY: 5),
                                          child: AppText.body1(
                                            allMethods.trendingNews[index]
                                                ["title"],
                                            // "Coronavirus is no longer \n a top issue for Americans",
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
                          }),
                        ),
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
                            return Container(
                              width: 215,
                              child: InkWell(
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
                                            topic: allMethods
                                                .breakingNews[index]["topic"],
                                            newsDate:
                                                allMethods.breakingNews[index]
                                                    ["published_date"],
                                            newsTime:
                                                allMethods.breakingNews[index]
                                                    ["published_date"],
                                            title: allMethods
                                                .breakingNews[index]["title"],
                                            author: allMethods
                                                            .breakingNews[index]
                                                        ["author"] ==
                                                    ""
                                                ? "Annonymous"
                                                : allMethods.breakingNews[index]
                                                        ["author"] ??
                                                    "Annonymous",
                                            rights: allMethods
                                                .breakingNews[index]["rights"],
                                            summary: allMethods
                                                .breakingNews[index]["summary"],
                                          )),
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 180,
                                      clipBehavior: Clip.hardEdge,
                                      margin: const EdgeInsets.only(left: 15),
                                      width: 215,
                                      // height: 150,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF2A2428),
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: CachedNetworkImage(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        imageUrl: allMethods.breakingNews[index]
                                                    ["media"] ==
                                                ""
                                            ? Api.noImage
                                            : allMethods.breakingNews[index]
                                                        ["media"]
                                                    .contains("?p=twitter")
                                                ? Api.noImage
                                                : allMethods.breakingNews[index]
                                                        ["media"] ??
                                                    Api.noImage,
                                        // "https://images.pexels.com/photos/1472334/pexels-photo-1472334.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 5.0),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Container(
                                        width: 215,
                                        height: 60,
                                        child: AppText.body1(
                                          allMethods.breakingNews[index]
                                              ["title"],
                                          // "China economy hit by\ndouble whammy in march",
                                          multiText: true,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        // mainAxisSize: MainAxisSize.min,
                                        children: [
                                          AppText.body2(
                                            timeago.format(
                                              DateTime.parse(
                                                allMethods.breakingNews[index]
                                                    ["published_date"],
                                              ),
                                            ),
                                            // "2 hours ago",
                                            color: Colors.red.shade900,
                                          ),
                                          const SizedBox(width: 5.0),
                                          CircleAvatar(
                                            radius: 2.0,
                                            backgroundColor:
                                                Colors.red.shade900,
                                          ),
                                          const SizedBox(width: 5.0),
                                          Expanded(
                                            child: AppText.body2(
                                              "By ${allMethods.breakingNews[index]["author"] == "" ? "Annonymous" : allMethods.breakingNews[index]["author"] ?? "Annonymous"}",
                                              color: Colors.red.shade900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
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
