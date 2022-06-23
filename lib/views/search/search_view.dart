import 'package:flutter/material.dart';
import 'package:tomel_news_app/utils/all_methods.dart';
import 'package:tomel_news_app/views/search/components/news_search_items.dart';
import 'package:tomel_news_app/views/search/components/news_search_items_skeleton.dart';
import 'package:tomel_news_app/views/search/components/search_container.dart';

class SearchView extends StatefulWidget {
  const SearchView({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final allMethods = AllMethods();
  String searched = "g";
  @override
  Widget build(BuildContext context) {
    // TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            // AppText.heading1("Tomel News"),
            SearchContainer(
              onPressed: () {
                setState(() {
                  allMethods.getNewsSearch(
                      context: context,
                      search: AllMethods.searchController.text,
                      toSetState: () {
                        setState(() {});
                      });
                  allMethods.newsSearch.clear();
                  AllMethods.searchController.clear();
                  searched = AllMethods.searchController.text;
                });
              },
            ),
            const SizedBox(height: 15.0),

            Expanded(
              child: allMethods.newsSearch.isEmpty &&
                      searched == AllMethods.searchController.text
                  ? const NewSearchItemsSkeleton()
                  : NewSearchItems(
                      newsSearch: allMethods.newsSearch,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
