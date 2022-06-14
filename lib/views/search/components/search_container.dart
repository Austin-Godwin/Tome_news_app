import 'package:flutter/material.dart';

import '../../../utils/all_methods.dart';

class SearchContainer extends StatelessWidget {
  final Function() onPressed;
  const SearchContainer({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // IconButton(
          //   padding: EdgeInsets.zero,
          //   constraints: const BoxConstraints(),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   icon: const Icon(
          //     Icons.chevron_left_rounded,
          //     size: 35.0,
          //     color: Colors.red,
          //   ),
          // ),
          // SizedBox(
          //   width: 20.0,
          // ),
          Expanded(
            child: Container(
              // width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 20.0, right: 5.0),
              decoration: BoxDecoration(
                  color: const Color(0xFFEDEDED),
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: AllMethods.searchController,
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    child: IconButton(
                      onPressed: onPressed,
                      icon: const Icon(Icons.search),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
