import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tomel_news_app/utils/all_methods.dart';
import '../../constants/api.dart';
import '../../utils/text.dart';
import '../main_news_view.dart';

class BookmarkView extends StatefulWidget {
  const BookmarkView({Key? key}) : super(key: key);

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  AllMethods allMethods = AllMethods();
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
                const SizedBox(height: 22.0),
                allMethods.bookMarkList.isEmpty
                    ? Center(
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 2.8),
                            AppText.heading1(
                              "No BookMark",
                              color: Colors.grey.shade500,
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            itemCount: allMethods.bookMarkList.length,
                            itemBuilder: ((context, index) {
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
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: allMethods.bookMarkList[index]
                                                  ["media"] ==
                                              ""
                                          ? Api.noImage
                                          // : allMethods.newsSearch[index]["media"]
                                          //         .contains("?p=twitter")
                                          //     ? Api.noImage
                                          : allMethods.bookMarkList[index]
                                                  ["media"] ??
                                              Api.noImage,
                                      // "https://images.pexels.com/photos/3064079/pexels-photo-3064079.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 15.0),
                                  Expanded(
                                    child: AppText.body1(
                                      allMethods.bookMarkList[index]["title"],
                                      // "At least 14 killed , including 7\n"
                                      // "children, after floods in landsides\n"
                                      // "in Brazil's Rio de Janeiro state.",
                                      multiText: true,
                                    ),
                                  ),
                                  Container(
                                    clipBehavior: Clip.hardEdge,
                                    alignment: Alignment.center,
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.red,
                                          width: 2.0,
                                        ),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MainNewsView(
                                                imageUrl: allMethods
                                                                .bookMarkList[
                                                            index]["media"] ==
                                                        ""
                                                    ? Api.noImage
                                                    // : allMethods.newsSearch[index]["media"]
                                                    //         .contains("?p=twitter")
                                                    //     ? Api.noImage
                                                    : allMethods.bookMarkList[
                                                            index]["media"] ??
                                                        Api.noImage,
                                                topic: allMethods
                                                        .bookMarkList[index]
                                                    ["topic"],
                                                newsDate: allMethods
                                                        .bookMarkList[index]
                                                    ["published_date"],
                                                newsTime: allMethods
                                                        .bookMarkList[index]
                                                    ["published_date"],
                                                title: allMethods
                                                        .bookMarkList[index]
                                                    ["title"],
                                                author: allMethods
                                                        .bookMarkList[index]
                                                    ["author"],
                                                rights: allMethods
                                                        .bookMarkList[index]
                                                    ["rights"],
                                                summary: allMethods
                                                        .bookMarkList[index]
                                                    ["summary"],
                                              ),
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.chevron_right_rounded,
                                          size: 18,
                                          color: Colors.red,
                                        )),
                                  ),
                                ],
                              );
                            })),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
