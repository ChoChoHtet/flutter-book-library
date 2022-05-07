import 'package:book_library/resource/color.dart';
import 'package:book_library/resource/string.dart';
import 'package:book_library/widgets/custom_icon_view.dart';
import 'package:book_library/widgets/normal_text.dart';
import 'package:flutter/material.dart';

class ItemGridView extends StatelessWidget {
  const ItemGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BookCoverSection(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.325,
            child: const NormalText(
              text: "Never Send a human hello bla bla",
              textSize: 14,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.325,
            child: const NormalText(
              text: "Yong Zhao , Gaomi",
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width *0.2,
      height: MediaQuery.of(context).size.height * 0.22,
      margin: const EdgeInsets.only(right: 14),
      padding: const EdgeInsets.only(bottom: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
            image: NetworkImage(imgUrl3), fit: BoxFit.cover),
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
