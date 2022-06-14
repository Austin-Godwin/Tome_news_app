import 'package:flutter/material.dart';
import 'package:tomel_news_app/utils/all_methods.dart';
import 'package:tomel_news_app/views/search/components/news_search_items.dart';
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
                  AllMethods.searchController.clear();
                });
              },
            ),
            const SizedBox(height: 15.0),

            Expanded(
              child: NewSearchItems(
                newsSearch: allMethods.newsSearch,
              ),
            )
          ],
        ),
      ),
    );
  }
}
