import 'package:flutter/material.dart';

import '../../../constants/api.dart';
// import '../../../utils/all_methods.dart';
import '../../../widgets/news_card.dart';
import '../../main_news_view.dart';

class NewSearchItems extends StatelessWidget {
  final List<Map<String, dynamic>> newsSearch;
  const NewSearchItems({Key? key, required this.newsSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: newsSearch.length,
          itemBuilder: ((context, index) {
            return NewsCard(
              imageUrl: newsSearch[index]["media"] == ""
                  ? Api.noImage
                  // : allMethods.newsSearch[index]["media"]
                  //         .contains("?p=twitter")
                  //     ? Api.noImage
                  : newsSearch[index]["media"] ?? Api.noImage,
              title: newsSearch[index]["title"],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainNewsView(
                      imageUrl: newsSearch[index]["media"] == ""
                          ? Api.noImage
                          // : allMethods.newsSearch[index]["media"]
                          //         .contains("?p=twitter")
                          //     ? Api.noImage
                          : newsSearch[index]["media"] ?? Api.noImage,
                      topic: newsSearch[index]["topic"],
                      newsDate: newsSearch[index]["published_date"],
                      newsTime: newsSearch[index]["published_date"],
                      title: newsSearch[index]["title"],
                      // icon: AllMethods.onClicked
                      //       ? Icons.bookmark_add_rounded
                      //       : Icons.bookmark_add_outlined,
                      author: newsSearch[index]["author"],
                      rights: newsSearch[index]["rights"],
                      summary: newsSearch[index]["summary"],
                    ),
                  ),
                );
              },
            );
          })),
    );
  }
}
