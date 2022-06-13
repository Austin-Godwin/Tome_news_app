import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tomel_news_app/constants/api.dart';
import 'package:tomel_news_app/utils/all_methods.dart';
import 'package:tomel_news_app/views/search/search_view.dart';
import '../../utils/text.dart';
import '../main_news_view.dart';

class SearchCategoryView extends StatefulWidget {
  const SearchCategoryView({Key? key}) : super(key: key);

  @override
  State<SearchCategoryView> createState() => _SearchCategoryViewState();
}

class _SearchCategoryViewState extends State<SearchCategoryView> {
  int selectedindex = 0;
  final allMethods = AllMethods();
  final pageController = PageController();
  bool isBusy = false;
  List<String> tabList = [
    "World",
    "Politics",
    "Business",
    "Health",
    "Sports",
    "Entertainment",
    "Travel",
    "Music",
    "Technology"
  ];
  @override
  void initState() {
    allMethods.getNewsSearch(
        search: tabList[0],
        toSetState: () {
          setState(() {});
        });
    super.initState();
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
                    "Explore The World",
                  ),
                ),
                const SizedBox(height: 22.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchView(
                              // searchList: allMethods.newsSearch,
                              ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 5.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFFEDEDED),
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText.body1(
                            "Search",
                            color: Colors.grey.shade400,
                          ),
                          // Expanded(
                          //   child: TextFormField(
                          //     decoration: InputDecoration(
                          //       hintText: "Search",
                          //       hintStyle: TextStyle(color: Colors.grey.shade400),
                          //       border: InputBorder.none,
                          //     ),
                          //   ),
                          // ),
                          const CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Icon(Icons.search
                                // onPressed: () {},
                                // icon: Icon(Icons.search),
                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                      padding: const EdgeInsets.only(right: 20, left: 10),
                      // controller: pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: tabList.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          alignment: Alignment.center,
                          width: 135,
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                            color: selectedindex == index
                                ? Colors.red
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(
                              color: Colors.red,
                              width: 2.0,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isBusy = true;
                                selectedindex = index;
                                allMethods.getNewsSearch(
                                    context: context,
                                    search: tabList[index],
                                    toSetState: () {
                                      setState(() {});
                                    });
                                isBusy = false;
                              });
                            },
                            child: AppText.body1(
                              tabList[index],
                              color: selectedindex == index
                                  ? Colors.white
                                  : Colors.red,
                            ),
                          ),
                        );
                      })),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
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
                                imageUrl: allMethods.newsSearch[index]
                                            ["media"] ==
                                        ""
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
