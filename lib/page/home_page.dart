import 'package:book_library/resource/dimen.dart';
import 'package:book_library/resource/string.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: const [
                  Icon(
                    Icons.search,
                    size: normalIconSize,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    homeSearchPlayBook,
                    style: TextStyle(fontSize: normalTextSize),
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/cafe_004.png"),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
