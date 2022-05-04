import 'package:book_library/resource/dimen.dart';
import 'package:book_library/widgets/title_text.dart';
import 'package:flutter/material.dart';

class TitleWithSeeMore extends StatelessWidget {
  final String title;
  final VoidCallback onTapSeeMore;

  const TitleWithSeeMore(
      {Key? key, required this.title, required this.onTapSeeMore})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleText(title: title),
        const Icon(
          Icons.arrow_forward_ios_outlined,
          size: normalIconSize,
          color: Colors.blue,
        ),
      ],
    );
  }
}
