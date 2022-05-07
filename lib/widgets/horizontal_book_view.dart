import 'package:book_library/widgets/title_with_see_more_view.dart';
import 'package:flutter/material.dart';

import '../viewItems/item_book_view.dart';

class HorizontalBookView extends StatelessWidget {
  final String title;
  final String imgPath;
  final String description;
  final String author;
  final VoidCallback onTapBook;

  const HorizontalBookView({
    Key? key,
    required this.title,
    required this.imgPath,
    required this.description,
    required this.author,
    required this.onTapBook,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWithSeeMore(
          title: title,
          onTapSeeMore: () => debugPrint("on tap see more"),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (builder, index) => InkWell(
                onTap: onTapBook,
                child: ItemBookView(
                      imgPath: imgPath,
                      description: "Learn UX for designer example books",
                      author: "Jeff Gothelf",
                    ),
              )),
        )
      ],
    );
  }
}
