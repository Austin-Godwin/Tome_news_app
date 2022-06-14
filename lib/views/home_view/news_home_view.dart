import 'package:flutter/material.dart';
import 'package:tomel_news_app/views/home_view/components/breaking_news_items.dart';
import 'package:tomel_news_app/views/home_view/components/trending_news_items.dart';
import '../../utils/all_methods.dart';
import '../../utils/text.dart';

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
      allMethods.getTrendingNews(
          context: context,
          toSetState: () {
            setState(() {});
          });
    });
    Future.delayed(const Duration(seconds: 4), () {
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
                SizedBox(
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
                SizedBox(
                  // padding: EdgeInsets.only(left: 10),
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: allMethods.breakingNews.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : BreakingNewsItems(
                          breakingNews: allMethods.breakingNews,
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
