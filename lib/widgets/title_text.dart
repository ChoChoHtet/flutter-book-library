import 'package:book_library/resource/dimen.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({Key? key, required this.title, this.color = Colors.black87})
      : super(key: key);
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width *0.8,
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: color, fontSize: titleTextSize),
      ),
    );
  }
}
