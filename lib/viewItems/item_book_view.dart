import 'package:book_library/resource/dimen.dart';
import 'package:book_library/widgets/normal_text.dart';
import 'package:flutter/material.dart';

class ItemBookView extends StatelessWidget {
  const ItemBookView({
    Key? key,
    required this.imgPath,
    required this.description,
    required this.author,
  }) : super(key: key);
  final String imgPath;
  final String description;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.33,
      margin: const EdgeInsets.only(right: paddingNormal),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                image: NetworkImage(imgPath),
                fit: BoxFit.cover,
              ),
            ),
            child: const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.more_horiz_rounded,
                color: Colors.white,
                size: normalIconSize,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          NormalText(
            text: description,
          ),
          const SizedBox(
            height: 5,
          ),
          NormalText(
            text: author,
            textSize: smallTextSize,
          ),
          const SizedBox(
            height: paddingNormal,
          ),
        ],
      ),
    );
  }
}
