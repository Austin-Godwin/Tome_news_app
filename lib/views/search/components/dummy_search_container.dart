import 'package:flutter/material.dart';
import '../../../utils/text.dart';
import '../search_view.dart';

class DummySearchContainer extends StatelessWidget {
  const DummySearchContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchView(
                  // searchList: allMethods.newsSearch,
                  ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 5.0),
          decoration: BoxDecoration(
              color: const Color(0xFFEDEDED),
              borderRadius: BorderRadius.circular(50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.body1(
                "Search",
                color: Colors.grey.shade400,
              ),
              // Expanded(
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //       hintText: "Search",
              //       hintStyle: TextStyle(color: Colors.grey.shade400),
              //       border: InputBorder.none,
              //     ),
              //   ),
              // ),
              const CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.search
                    // onPressed: () {},
                    // icon: Icon(Icons.search),
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
