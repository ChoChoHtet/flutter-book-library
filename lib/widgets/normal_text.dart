import 'package:book_library/resource/dimen.dart';
import 'package:flutter/material.dart';

class NormalText extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  final FontWeight fontWeight;

  const NormalText({
    Key? key,
    required this.text,
    this.color = Colors.black87,
    this.textSize = normalTextSize,
    this.fontWeight = FontWeight.normal
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: color,
        fontSize: textSize,
        fontWeight: fontWeight
      ),
    );
  }
}
