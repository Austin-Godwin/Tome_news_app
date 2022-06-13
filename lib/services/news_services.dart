// import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tomel_news_app/enum/api_status.dart';
import 'package:tomel_news_app/utils/api_response.dart';
import '../constants/api.dart';

class NewsServices {
  // Future<List<Map<String, dynamic>>> getTrendingNews() async {
  //   try {
  //     http.Response response = await http.get(
  //         Uri.parse("${Api.baseUrl}/v1/search?q=${Api.trending}&lang=en"),
  //         headers: {
  //           Api.apiHost: Api.apiHostValue,
  //           Api.apiKey: Api.apiKeyValue
  //         });
  //     print("=========trendingNews Response Body==========");
  //     print(response.body);
  //     var data = jsonDecode(response.body)["articles"];
  //     print("=========trendingNews Data==========");
  //     print(data);
  //     List<Map<String, dynamic>> result =
  //         List<Map<String, dynamic>>.from(data.map((e) => e));
  //     print("=========trendingNews Result==========");
  //     print(result);
  //     return result;
  //   } catch (e) {
  //     print("This is the error message: $e");
  //     rethrow;
  //   }
  // }
  // Future<List<Map<String, dynamic>>> getEveryNews() async {
  //   try {
  //     http.Response response = await http.get(
  //         Uri.parse("${Api.baseUrl}/everything?q=keyword&apiKey=${Api.apikey}"),);
  //     print("=========EveryNews Response Body==========");
  //     print(response.body);
  //     var data = jsonDecode(response.body)["articles"];
  //     print("=========EveryNews Data==========");
  //     print(data);
  //     List<Map<String, dynamic>> result =
  //         List<Map<String, dynamic>>.from(data.map((e) => e));
  //     print("=========EveryNews Result==========");
  //     print(result);
  //     return result;
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }

  // Future<List<Map<String, dynamic>>> getBreakingNews() async {
  //   try {
  //     http.Response response = await http.get(
  //         Uri.parse(
  //             "${Api.baseUrl}/v1/search?q=${Api.breakingNews} africa&lang=en"),
  //         headers: {
  //           Api.apiHost: Api.apiHostValue,
  //           Api.apiKey: Api.apiKeyValue
  //         });
  //     print("=========breakingNews Response Body==========");
  //     print(response.body);
  //     var data = jsonDecode(response.body)["articles"];
  //     print("=========breakingNews Data==========");
  //     print(data);
  //     List<Map<String, dynamic>> result =
  //         List<Map<String, dynamic>>.from(data.map((e) => e));
  //     print("=========breakingNews Result==========");
  //     print(result);
  //     return result;
  //   } catch (e) {
  //     print("This is the error message: $e");
  //     rethrow;
  //   }
  // }

  // Future<List<Map<String, dynamic>>> getNewsBySearch({required String search}) async {
  //   try {
  //     http.Response response = await http.get(
  //         Uri.parse("${Api.baseUrl}/v1/search?q=$search&lang=en"),
  //         headers: {
  //           Api.apiHost: Api.apiHostValue,
  //           Api.apiKey: Api.apiKeyValue
  //         });
  //     print("=========newsSearch Response Body==========");
  //     print(response.body);
  //     var data = jsonDecode(response.body)["articles"];
  //     print("=========newsSearch Data==========");
  //     print(data);
  //     List<Map<String, dynamic>> result =
  //         List<Map<String, dynamic>>.from(data.map((e) => e));
  //     print("=========newsSearch Result==========");
  //     print(result);
  //     return result;
  //   } catch (e) {
  //     print("This is the error message: $e");
  //     rethrow;
  //   }
  // }
  // Future<List<Map<String, dynamic>>> getNews({required String search}) async {
  //   try {
  //     http.Response response = await http.get(
  //         Uri.parse("${Api.baseUrl}/v1/search?q=$search&lang=en"),
  //         headers: {
  //           Api.apiHost: Api.apiHostValue,
  //           Api.apiKey: Api.apiKeyValue
  //         });
  //     print("=========newsSearch Response Body==========");
  //     print(response.body);
  //     var data = jsonDecode(response.body)["articles"];
  //     print("=========newsSearch Data==========");
  //     print(data);
  //     List<Map<String, dynamic>> result =
  //         List<Map<String, dynamic>>.from(data.map((e) => e));
  //     print("=========newsSearch Result==========");
  //     print(result);
  //     return result;
  //   } catch (e) {
  //     print("This is the error message: $e");
  //     rethrow;
  //   }
  // }
  Future<ApiResponse> getNews({required String search}) async {
    try {
      http.Response response = await http.get(
          Uri.parse("${Api.baseUrl}/v1/search?q=$search&lang=en"),
          headers: {
            Api.apiHost: Api.apiHostValue,
            Api.apiKey: Api.apiKeyValue
          });
      print("=========newsSearch Response Body==========");
      print(response.body);
      var newsData = jsonDecode(response.body)["articles"];
      print("=========newsSearch newsData==========");
      print(newsData);
      if (response.statusCode == 200) {
        return ApiResponse(
          status: Status.success,
          data: List<Map<String, dynamic>>.from(newsData.map((e) => e)),
        );
      } else {
        return (ApiResponse(
          status: Status.error,
          data: newsData["message"],
        ));
      }
    } catch (e) {
      print("This is the error message: $e");
      if (e is HandshakeException ||
          e is SocketException ||
          e is TimeoutException) {
        return ApiResponse(
          status: Status.networkError,
          data: null,
        );
      } else {
        return ApiResponse(
          status: Status.error,
          data: 'Search not found',
        );
      }
    }
  }
}

// List<Map<String, dynamic>> result =
//           List<Map<String, dynamic>>.from(data.map((e) => e));
//       print("=========newsSearch Result==========");
//       print(result);
//       return result;
