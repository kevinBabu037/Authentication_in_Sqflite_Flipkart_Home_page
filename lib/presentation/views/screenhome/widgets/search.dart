import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CupertinoSearchTextField(
      backgroundColor: Color.fromARGB(255, 219, 234, 240),
      padding: EdgeInsets.all(10),
      suffixIcon: Icon(
        CupertinoIcons.xmark_circle_fill,
        color: Colors.grey,
      ),
      prefixIcon: Icon(
        CupertinoIcons.search,
        color: Colors.grey,
      ),
    );
  }
}
