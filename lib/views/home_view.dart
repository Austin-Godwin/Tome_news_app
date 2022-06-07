import 'package:flutter/material.dart';
import 'package:tomel_news_app/views/bookmark/bookmark_view.dart';
import 'package:tomel_news_app/views/news_home_view.dart';
import 'package:tomel_news_app/views/search/search_category_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: PageView(
          onPageChanged: onPageChanged,
          controller: _pageController,
          children: const [
            NewsHomeView(),
            SearchCategoryView(),
            BookmarkView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          selectedItemColor: Colors.red,
          // fixedColor: const Color(0xFF2A2428),
          unselectedItemColor: const Color(0xFF2A2428),
          onTap: onPageChanged,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: "Search",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.play_arrow_rounded),
            //   label: "Videos",
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmarks_rounded),
              label: "Bookmarks",
            ),
          ],
        ),
      ),
    );
  }

  onPageChanged(int index) {
    setState(() {
      _selectedPage = index;
    });
    _pageController.jumpToPage(index);
  }
}
