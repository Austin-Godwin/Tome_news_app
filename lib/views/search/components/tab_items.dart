import 'package:flutter/material.dart';
import 'package:tomel_news_app/constants/default_list.dart';
import '../../../utils/all_methods.dart';
import 'tab_card.dart';

class TabItems extends StatefulWidget {
  // final List<String> tabList;
  const TabItems({
    Key? key,
    // required this.tabList,
  }) : super(key: key);

  @override
  State<TabItems> createState() => _TabItemsState();
}

class _TabItemsState extends State<TabItems> {
  final allMethods = AllMethods();
  int selectedindex = 0;
  bool isBusy = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          padding: const EdgeInsets.only(right: 20, left: 10),
          // controller: pageController,
          scrollDirection: Axis.horizontal,
          itemCount: DefaultList.tabList.length,
          itemBuilder: ((context, index) {
            return TabCard(
              tabColor:
                  selectedindex == index ? Colors.red : Colors.transparent,
              onTap: () {
                setState(() {
                  isBusy = true;
                  selectedindex = index;
                  print(DefaultList.tabList.length);
                  allMethods.getNewsSearch(
                      context: context,
                      search: DefaultList.tabList[index],
                      toSetState: () {
                        setState(() {});
                      });
                  print(DefaultList.tabList[0]);
                  isBusy = false;
                });
              },
              text: DefaultList.tabList[index],
              textColor: selectedindex == index ? Colors.white : Colors.red,
            );
          })),
    );
  }
}
