import 'package:flutter/material.dart';
import 'package:tomel_news_app/utils/all_methods.dart';
import 'package:tomel_news_app/views/search/components/dummy_search_container.dart';
import 'package:tomel_news_app/views/search/components/news_search_items.dart';
import 'package:tomel_news_app/widgets/custom_app_bar.dart';
import '../../constants/default_list.dart';
import '../../utils/text.dart';
import 'components/tab_card.dart';

class SearchCategoryView extends StatefulWidget {
  const SearchCategoryView({Key? key}) : super(key: key);

  @override
  State<SearchCategoryView> createState() => _SearchCategoryViewState();
}

class _SearchCategoryViewState extends State<SearchCategoryView> {
  final allMethods = AllMethods();
  int selectedindex = 0;
  bool isBusy = false;
  @override
  void initState() {
    allMethods.getNewsSearch(
        search: DefaultList.tabList[0],
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
          const CustomAppBar(),
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
                const DummySearchContainer(),
                const SizedBox(height: 25.0),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                      padding: const EdgeInsets.only(right: 20, left: 10),
                      scrollDirection: Axis.horizontal,
                      itemCount: DefaultList.tabList.length,
                      itemBuilder: ((context, index) {
                        return TabCard(
                          tabColor: selectedindex == index
                              ? Colors.red
                              : Colors.transparent,
                          onTap: () {
                            setState(() {
                              isBusy = true;
                              selectedindex = index;
                              allMethods.getNewsSearch(
                                  context: context,
                                  search: DefaultList.tabList[index],
                                  toSetState: () {
                                    setState(() {});
                                  });
                              isBusy = false;
                            });
                          },
                          text: DefaultList.tabList[index],
                          textColor: selectedindex == index
                              ? Colors.white
                              : Colors.red,
                        );
                      })),
                ),
                const SizedBox(height: 20.0),
                NewSearchItems(
                  newsSearch: allMethods.newsSearch,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
