import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:tomel_news_app/utils/all_methods.dart';
import 'package:tomel_news_app/views/main_news_view.dart';

import '../../constants/api.dart';
import '../../utils/text.dart';

class SearchView extends StatefulWidget {
  // final List<Map<String, dynamic>> searchList;
  // final Function(String search)? searchNews;
  const SearchView({
    Key? key,
    // required this.searchList,
    // this.searchNews
  }) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final allMethods = AllMethods();
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            // AppText.heading1("Tomel News"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // IconButton(
                  //   padding: EdgeInsets.zero,
                  //   constraints: const BoxConstraints(),
                  //   onPressed: () {
                  //     Navigator.pop(context);
                  //   },
                  //   icon: const Icon(
                  //     Icons.chevron_left_rounded,
                  //     size: 35.0,
                  //     color: Colors.red,
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 20.0,
                  // ),
                  Expanded(
                    child: Container(
                      // width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 20.0, right: 5.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFFEDEDED),
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: "Search",
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade400),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  allMethods.getNewsSearch(
                                      context: context,
                                      search: searchController.text,
                                      toSetState: () {
                                        setState(() {});
                                      });
                                  searchController.clear();
                                });
                              },
                              icon: const Icon(Icons.search),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),

            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    itemCount: allMethods.newsSearch.length,
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
                              imageUrl:
                                  allMethods.newsSearch[index]["media"] == ""
                                      ? Api.noImage
                                      // : allMethods.newsSearch[index]["media"]
                                      //         .contains("?p=twitter")
                                      //     ? Api.noImage
                                      : allMethods.newsSearch[index]["media"] ??
                                          Api.noImage,
                              // "https://images.pexels.com/photos/3064079/pexels-photo-3064079.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 15.0),
                          Expanded(
                            child: AppText.body1(
                              allMethods.newsSearch[index]["title"],
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
                                      builder: (context) => MainNewsView(
                                        imageUrl: allMethods.newsSearch[index]
                                                    ["media"] ==
                                                ""
                                            ? Api.noImage
                                            // : allMethods.newsSearch[index]["media"]
                                            //         .contains("?p=twitter")
                                            //     ? Api.noImage
                                            : allMethods.newsSearch[index]
                                                    ["media"] ??
                                                Api.noImage,
                                        topic: allMethods.newsSearch[index]
                                            ["topic"],
                                        newsDate: allMethods.newsSearch[index]
                                            ["published_date"],
                                        newsTime: allMethods.newsSearch[index]
                                            ["published_date"],
                                        title: allMethods.newsSearch[index]
                                            ["title"],
                                        author: allMethods.newsSearch[index]
                                            ["author"],
                                        rights: allMethods.newsSearch[index]
                                            ["rights"],
                                        summary: allMethods.newsSearch[index]
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
