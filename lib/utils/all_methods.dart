import 'package:tomel_news_app/services/news_services.dart';
import 'dart:math';

class AllMethods {
  final NewsServices newsServices = NewsServices();
  final randomNumber = Random().nextInt(40);
  List<Map<String, dynamic>> trendingNews = [];
  List<Map<String, dynamic>> breakingNews = [];
  List<Map<String, dynamic>> newsSearch = [];
  List<Map<String, dynamic>> bookMarkList = [];
  getTrendingNews({required Function() toSetState}) async {
    toSetState();
    // getBreakingNews(toSetState: toSetState);
    print("I have entered trending news");
    trendingNews = await newsServices.getTrendingNews();
    print("=========trendingNews==========");
    print(trendingNews);
    toSetState();
  }

  getBreakingNews({required Function() toSetState}) async {
    toSetState();
    print("I have entered breaking news");
    breakingNews = await newsServices.getBreakingNews();
    print("=========breakingNews==========");
    print(breakingNews);
    toSetState();
  }

  getNewsSearch(
      {required String search, required Function() toSetState}) async {
    toSetState();
    print("I have entered news search");
    newsSearch = await newsServices.getNewsBySearch(search: search);
    print("=========newsSearch==========");
    toSetState();
  }

  addToBookmark(Map<String, dynamic> item) {
    bookMarkList.add(item);
    // print("bookmark added with the total of: ${bookMarkList.length}");
  }

  removeFromBookmark(Map<String, dynamic> news) {
    // bookMarkList.remove(news.remove("title"));
    bookMarkList.removeWhere((item) {
      return item["title"] == news["title"];
    });
    // // print("bookmark removed with the total of: ${bookMarkList.length}");
  }
}
