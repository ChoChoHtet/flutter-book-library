import 'package:flutter/material.dart';

import '../resource/dimen.dart';
import '../resource/string.dart';

class CustomSearchView extends StatelessWidget {
  const CustomSearchView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: const [
            Icon(
              Icons.arrow_back_ios,
              size: normalIconSize,
            ),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Hello"
                ),
              ),
            ),
            Icon(
              Icons.mic,
              size: normalIconSize,
            ),
          ],
        ),
      )
    );
  }

}