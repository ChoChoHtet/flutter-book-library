import 'package:book_library/resource/dimen.dart';
import 'package:book_library/resource/string.dart';
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
      width: 150,
      margin: const EdgeInsets.only(right: paddingNormal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 180,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                  image: NetworkImage(imgUrl3), fit: BoxFit.cover),
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
          const SizedBox(height: 5,),
          NormalText(text: description,),
          const SizedBox(height: 5,),
          NormalText(text: author,textSize: smallTextSize,),
          const SizedBox(height: paddingNormal,),
        ],
      ),
    );
  }
}
