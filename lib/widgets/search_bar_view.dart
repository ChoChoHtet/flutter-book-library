import 'package:flutter/material.dart';

import '../resource/dimen.dart';
import '../resource/string.dart';

class SearchBarView extends StatelessWidget {
  const SearchBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
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
    );
  }

}