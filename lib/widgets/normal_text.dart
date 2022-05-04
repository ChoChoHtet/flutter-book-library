import 'package:book_library/resource/dimen.dart';
import 'package:flutter/material.dart';

class NormalText extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;

  const NormalText({
    Key? key,
    required this.text,
    this.color = Colors.blueGrey,
    this.textSize = normalTextSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: color,
        fontSize: textSize,
      ),
    );
  }
}
