import 'package:book_library/resource/dimen.dart';
import 'package:book_library/resource/string.dart';
import 'package:book_library/widgets/custom_icon_view.dart';
import 'package:book_library/widgets/normal_text.dart';
import 'package:flutter/material.dart';

class ItemGridView extends StatelessWidget {
  const ItemGridView({
    Key? key,
    required this.imgPath,
    required this.title,
    required this.author,
  }) : super(key: key);
  final String imgPath;
  final String title;
  final String author;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookCoverSection(imgPath: imgPath,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.325,
            child: NormalText(
              text: title,
              textSize: 14,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.325,
            child: NormalText(
              text: author,
              textSize: 14,
            ),
          )
        ],
      ),
    );
  }
}

class BookCoverSection extends StatelessWidget {
  const BookCoverSection({
    Key? key,
    required this.imgPath,
  }) : super(key: key);
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.22,
      margin: const EdgeInsets.only(right: paddingNormal),
      padding: const EdgeInsets.only(bottom: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image:  DecorationImage(
          image: NetworkImage(imgPath.isNotEmpty ? imgPath : imgUrl3),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.more_horiz_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                  margin: const EdgeInsets.only(top: 8, left: 10),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const NormalText(
                    text: "Sample",
                    color: Colors.white,
                    textSize: 12,
                    fontWeight: FontWeight.w500,
                  ))),
          const Align(
            alignment: Alignment.bottomRight,
            child: CustomIconView(
              image: "assets/done.png",
            ),
          )
        ],
      ),
    );
  }
}
