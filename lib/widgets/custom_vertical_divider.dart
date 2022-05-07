
import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({
    Key? key,
    required this.height,
    this.color = Colors.black87,
  }) : super(key: key);

  final double height;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: height,
      color: color,
    );
  }
}
