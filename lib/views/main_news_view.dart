import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tomel_news_app/constants/api.dart';
import 'package:tomel_news_app/utils/all_methods.dart';
import 'package:tomel_news_app/utils/text.dart';

class MainNewsView extends StatefulWidget {
  final String imageUrl;
  final String topic;
  final String newsDate;
  final String newsTime;
  final String title;
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
  // final allMethods = AllMethods();
  // changeColor(bool changed) {
  //   setState(() {
  //     onClicked = changed;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: CachedNetworkImage(
                    imageUrl: widget.imageUrl,
                    // "https://images.pexels.com/photos/7005682/pexels-photo-7005682.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.2,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(
                      0.3,
                    ),
                  ),
                  // height: MediaQuery.of(context).size.height / 2.2,
                  // child: CachedNetworkImage(
                  //   imageUrl:
                  //       "https://images.pexels.com/photos/7005682/pexels-photo-7005682.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  //   fit: BoxFit.cover,
                  // ),
                ),
                //             required this.imageUrl,
                // required this.topic,
                // required this.newsDate,
                // required this.newsTime,
                // required this.title,
                // // required this.profileImageurl,
                // required this.author,
                // required this.rights,
                // required this.summary,
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
                    icon: Icon(
                        onClicked
                            ? Icons.bookmark_add_rounded
                            : Icons.bookmark_add_outlined,
                        size: 35.0,
                        color: Colors.white),
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
                  top: 280,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height / 1.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.red),
                              child: AppText.button(
                                widget.topic,
                                // "Entertainment",
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            AppText.body2(
                              DateFormat("dd MMM yyyy")
                                  .format(DateTime.parse(widget.newsDate)),
                              // "1st June 2022",
                              color: Colors.red.shade900,
                            ),
                            const SizedBox(width: 5.0),
                            CircleAvatar(
                              radius: 2.0,
                              backgroundColor: Colors.red.shade900,
                            ),
                            const SizedBox(width: 5.0),
                            AppText.body2(
                              DateFormat("hh:mm a")
                                  .format(DateTime.parse(widget.newsTime)),
                              // "12:44pm",
                              color: Colors.red.shade900,
                            ),
                          ],
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
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 15.0,
                              backgroundImage: CachedNetworkImageProvider(
                                Api.noProfileImage,
                                // "https://images.pexels.com/photos/4571943/pexels-photo-4571943.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                                child: AppText.caption(
                                    "By ${widget.author}, ${widget.rights}"))
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height,
                          child: SingleChildScrollView(
                            child: AppText.body1(
                              widget.summary,
                              // "htklaklakladkidoifjdfjadklakmdfkmkfmls"
                              // "jdskjasjdkjksjdjsaiuaiudiusdiadiudauiuia"
                              // "jkasdjcacinjacnkjnancajkcanckjnakjknackjk"
                              // "lkadnafjioiiasdoiasoiodisdiodosdiodsiisdii"
                              // "akjfaufhduishiuaisdudsiausdaosapioiosiifiif"
                              // "jdskjasjdkjksjdjsaiuaiudiusdiadiudauiuia"
                              // "jkasdjcacinjacnkjnancajkcanckjnakjknackjk"
                              // "sjkdkajjadk.\n"
                              // "\n"
                              // "sadjfajiasojaifdasfjifjuifaojoiajfijikdfji"
                              // "asfhafukaskasjfjhasjkfdjhfhadsaiuweiwueiej"
                              // "aksdfhuashisdidhaalasjklcamlcmlkcjcajojioo"
                              // "jasdfhjsahfhlusihuafihauhuuchuhcusuisaiuai"
                              // "aksdfhusadhaufufudaichuchjcijioajiajcasoiji"
                              // "kjdfahdfajkfafahkaffhiueioioqwifjafklalk;la"
                              // "sadjfajiasojaifdasfjifjuifaojoiajfijikdfji"
                              // "asfhafukaskasjfjhasjkfdjhfhadsaiuweiwueiej"
                              // "aksdfhuashisdidhaalasjklcamlcmlkcjcajojioo.\n"
                              // "\n"
                              // "sadjfajiasojaifdasfjifjuifaojoiajfijikdfji"
                              // "asfhafukaskasjfjhasjkfdjhfhadsaiuweiwueiej"
                              // "aksdfhuashisdidhaalasjklcamlcmlkcjcajojioo"
                              // "jasdfhjsahfhlusihuafihauhuuchuhcusuisaiuai"
                              // "aksdfhusadhaufufudaichuchjcijioajiajcasoiji"
                              // "kjdfahdfajkfafahkaffhiueioioqwifjafklalk;la"
                              // "sadjfajiasojaifdasfjifjuifaojoiajfijikdfji"
                              // "asfhafukaskasjfjhasjkfdjhfhadsaiuweiwueiej"
                              // "aksdfhuashisdidhaalasjklcamlcmlkcjcajojioo.",
                              multiText: true,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
