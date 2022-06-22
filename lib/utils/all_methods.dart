import 'package:flutter/material.dart';
import 'package:tomel_news_app/constants/api.dart';
import 'package:tomel_news_app/services/news_services.dart';
import 'dart:math';

import 'package:tomel_news_app/utils/api_response.dart';
import 'package:tomel_news_app/utils/text.dart';

import '../enum/api_status.dart';

class AllMethods {
  final NewsServices newsServices = NewsServices();
  // final randomNumber = Random().nextInt(40);
  List<Map<String, dynamic>> trendingNews = [];
  List<Map<String, dynamic>> breakingNews = [];
  List<Map<String, dynamic>> newsSearch = [];
  static List<Map<String, dynamic>> bookMarkList = [];
  static TextEditingController searchController = TextEditingController();
  // static bool onClicked = false;
  // getTrendingNews({required Function() toSetState}) async {
  //   toSetState();
  //   // getBreakingNews(toSetState: toSetState);
  //   print("I have entered trending news");
  //   trendingNews = await newsServices.getTrendingNews();
  //   print("=========trendingNews==========");
  //   print(trendingNews);
  //   toSetState();
  // }
  getTrendingNews(
      {BuildContext? context, required Function() toSetState}) async {
    toSetState();
    // getBreakingNews(toSetState: toSetState);
    print("I have entered trending news");
    ApiResponse response = await newsServices.getNews(search: Api.trending);
    if (response.status == Status.success) {
      trendingNews = response.data;
      print("=========trendingNews==========");
      print(trendingNews);
    } else if (response.status == Status.networkError) {
      final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: AppText.body2(
          "An Error Occured, please check your internet connection,",
          color: Colors.white,
        ),
        duration: const Duration(seconds: 6),
      );
      ScaffoldMessenger.of(context!).showSnackBar(snackBar);
    } else if (response.status == Status.error) {
      final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content:
            // response.data,
            AppText.body2(
          response.data,
          color: Colors.white,
        ),
        duration: const Duration(seconds: 6),
      );
      ScaffoldMessenger.of(context!).showSnackBar(snackBar);
    } else {
      Scaffold(
        body: Container(
          color: Colors.blue[400],
        ),
      );
    }
    toSetState();
  }

  // getBreakingNews({required Function() toSetState}) async {
  //   toSetState();
  //   print("I have entered breaking news");
  //   breakingNews = await newsServices.getBreakingNews();
  //   print("=========breakingNews==========");
  //   print(breakingNews);
  //   toSetState();
  // }
  getBreakingNews(
      {BuildContext? context, required Function() toSetState}) async {
    toSetState();
    print("I have entered breaking news");
    ApiResponse response = await newsServices.getNews(search: Api.breakingNews);
    if (response.status == Status.success) {
      breakingNews = response.data;
      print("=========breakingNews==========");
      print(breakingNews);
    } else if (response.status == Status.networkError) {
      final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: AppText.body1(
          "An Error Occured, please check your internet connection,",
          color: Colors.white,
        ),
        duration: const Duration(seconds: 6),
      );
      ScaffoldMessenger.of(context!).showSnackBar(snackBar);
    } else if (response.status == Status.error) {
      final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: AppText.body2(
          response.data,
          color: Colors.white,
        ),
        duration: const Duration(seconds: 6),
      );
      ScaffoldMessenger.of(context!).showSnackBar(snackBar);
    } else {
      Scaffold(
        body: Container(
          color: Colors.blue[400],
        ),
      );
    }
    toSetState();
  }

  // getNewsSearch(
  //     {required String search, required Function() toSetState}) async {
  //   toSetState();
  //   print("I have entered news search");
  //   newsSearch = await newsServices.getNewsBySearch(search: search);
  //   print("=========newsSearch==========");
  //   toSetState();
  // }
  getNewsSearch(
      {BuildContext? context,
      required String search,
      required Function() toSetState}) async {
    toSetState();
    print("I have entered news search");
    if (search.isEmpty) {
      final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: AppText.body1(
          "Please enter a valid search",
          color: Colors.white,
        ),
        duration: const Duration(seconds: 6),
      );
      ScaffoldMessenger.of(context!).showSnackBar(snackBar);
    } else {
      ApiResponse response = await newsServices.getNews(search: search);
      if (response.status == Status.success) {
        newsSearch = response.data;
        print("=========newsSearch==========");
        print(newsSearch);
      } else if (response.status == Status.networkError) {
        final snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: AppText.body1(
            "An Error Occured, please check your internet connection,",
            color: Colors.white,
          ),
          duration: const Duration(seconds: 6),
        );
        ScaffoldMessenger.of(context!).showSnackBar(snackBar);
      } else if (response.status == Status.networkError) {
        final snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: response.data,
          // AppText.body2(
          //   response.data,
          //   color: Colors.white,
          // ),
          duration: const Duration(seconds: 6),
        );
        ScaffoldMessenger.of(context!).showSnackBar(snackBar);
      } else {
        Scaffold(
          body: Container(
            color: Colors.blue[400],
          ),
        );
      }
    }

    toSetState();
  }

  static addToBookmark(Map<String, dynamic> item) {
    bookMarkList.add(item);
    // print("bookmark added with the total of: ${bookMarkList.length}");
  }

  static removeFromBookmark(Map<String, dynamic> news) {
    // bookMarkList.remove(news.remove("title"));
    bookMarkList.removeWhere((item) {
      return item["title"] == news["title"];
    });
    // // print("bookmark removed with the total of: ${bookMarkList.length}");
  }
}
