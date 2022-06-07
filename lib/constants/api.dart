import 'package:intl/intl.dart';

class Api {
  //api url
  static const String baseUrl = "https://free-news.p.rapidapi.com";

  //api header parameter
  static const String apiHost = "X-RapidAPI-Host";
  static const String apiHostValue = "free-news.p.rapidapi.com";
  static const String apiKey = "X-RapidAPI-Key";
  static const String apiKeyValue =
      "5dc59fbc26mshf5b4499c224e0dcp12ce36jsndbd5ebd2d203";

  //current day
  // static final String currentDayNews =
  //     DateFormat("yyyy-MM-dd").format(DateTime.now());
  static const String trending = "trending";
  static const String breakingNews = "breaking news";

  // image to replace null images or image url with empty string in the api
  static const String noImage =
      "https://previews.123rf.com/images/mathier/mathier1905/mathier190500002/134557216-no-thumbnail-image-placeholder-for-forums-blogs-and-websites.jpg";

  // image to replace null profile images or empty profile image url in the api
  static const String noProfileImage =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";

  // static const String baseUrl = "https://newsapi.org/v2/";
  // static const String apikey = "cd470f61a42445ff985a3fabde7e7c19";
  // static final String currentTimeNews =
  //     DateFormat("h:mm a").format(DateTime.now());

}
