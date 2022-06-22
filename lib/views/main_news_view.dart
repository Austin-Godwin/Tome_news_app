import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:tomel_news_app/constants/api.dart';
import 'package:tomel_news_app/utils/all_methods.dart';
import 'package:tomel_news_app/utils/text.dart';
import 'package:tomel_news_app/widgets/author_profile.dart';
import 'package:tomel_news_app/widgets/news_description.dart';

class MainNewsView extends StatefulWidget {
  final String imageUrl;
  final String topic;
  final String newsDate;
  final String newsTime;
  final String title;
  final bool? fromBookMark;
  // final String profileImageurl;
  final String? author;
  final String rights;
  final String summary;
  const MainNewsView({
    Key? key,
    required this.imageUrl,
    required this.topic,
    required this.newsDate,
    required this.newsTime,
    required this.title,
    this.fromBookMark,
    // required this.profileImageurl,
    required this.author,
    required this.rights,
    required this.summary,
  }) : super(key: key);

  @override
  State<MainNewsView> createState() => _MainNewsViewState();
}

class _MainNewsViewState extends State<MainNewsView> {
  bool onClicked = false;

  @override
  void initState() {
    widget.fromBookMark == null ? false : true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              // alignment: AlignmentDirectional.bottomEnd,
              clipBehavior: Clip.none,

              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: CachedNetworkImage(
                    imageUrl: widget.imageUrl,
                    // "https://images.pexels.com/photos/7005682/pexels-photo-7005682.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(
                      0.3,
                    ),
                  ),
                ),
                Positioned(
                  // top: 10,
                  right: 15,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        onClicked = !onClicked;
                        if (onClicked) {
                          AllMethods.addToBookmark({
                            "media": widget.imageUrl,
                            "topic": widget.topic,
                            "published_date": widget.newsDate,
                            // "published_date": widget.newsTime,
                            "title": widget.title,
                            "author": widget.author,
                            "rights": widget.rights,
                            "summary": widget.summary,
                          });
                          // widget.fromBookMark = true;
                          // onClicked = true;

                          print(
                              "bookmark added with the total of: ${AllMethods.bookMarkList.length}");
                        } else {
                          print("in");
                          AllMethods.removeFromBookmark({
                            "media": widget.imageUrl,
                            "topic": widget.topic,
                            "published_date": widget.newsDate,
                            // "published_date": widget.newsTime,
                            "title": widget.title,
                            "author": widget.author,
                            "rights": widget.rights,
                            "summary": widget.summary,
                          });
                          // onClicked = false;

                          print(
                              "bookmark removed with the total of: ${AllMethods.bookMarkList.length}");
                        }
                        // print(allMethods.bookMarkList.length);
                      });
                    },
                    icon: widget.fromBookMark == true
                        ? const SizedBox()
                        : Icon(
                            // widget.icon,
                            onClicked
                                ? Icons.bookmark_add_rounded
                                : Icons.bookmark_add_outlined,
                            size: 35.0,
                            color: Colors.white,
                          ),

                    // Visibility(
                    //     visible: false,
                    //     maintainState: true,
                    //     child: Icon(
                    //         // widget.icon,
                    //         onClicked
                    //             ? Icons.bookmark_add_rounded
                    //             : Icons.bookmark_add_outlined,
                    //         size: 35.0,
                    //         color: Colors.white),
                    //   )
                    // : Visibility(
                    //     // visible: false,
                    //     child: Icon(
                    //         // widget.icon,
                    //         onClicked
                    //             ? Icons.bookmark_add_rounded
                    //             : Icons.bookmark_add_outlined,
                    //         size: 35.0,
                    //         color: Colors.white),
                    //   ),
                  ),
                ),
                Positioned(
                  // top: 10,
                  // left: 15,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.chevron_left_rounded,
                      size: 35.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  height: 600,
                  top: 280,
                  child: Container(
                    // height: 90,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 30),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: ListView(
                      // physics: const NeverScrollableScrollPhysics(),
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NewsDescription(
                          topic: widget.topic,
                          date: widget.newsDate,
                          time: widget.newsTime,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppText.heading2(
                          widget.title,
                          // "Will Smith resigns from the\n Academy",
                          multiText: true,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        AuthorProfile(
                          author: widget.author,
                          rights: widget.rights,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 300,
                          child: SingleChildScrollView(
                            child: AppText.body1(
                              widget.summary,
                              multiText: true,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
