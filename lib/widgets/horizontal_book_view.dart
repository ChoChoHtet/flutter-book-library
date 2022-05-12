import 'package:book_library/data/vos/book_vo.dart';
import 'package:book_library/resource/string.dart';
import 'package:book_library/widgets/title_with_see_more_view.dart';
import 'package:flutter/material.dart';

import '../viewItems/item_book_view.dart';

class HorizontalBookView extends StatelessWidget {
  final String title;
  final List<BookVO> bookList;
  final Function(String) onTapBook;
  final VoidCallback onTapSeeMore;

  const HorizontalBookView(
      {Key? key,
      required this.title,
      required this.bookList,
      required this.onTapBook,
      required this.onTapSeeMore})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTapSeeMore,
          child: TitleWithSeeMore(
            title: title,
            onTapSeeMore: () => debugPrint("on tap see more"),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bookList.length,
              itemBuilder: (builder, index) => InkWell(
                    onTap: (){
                      onTapBook(bookList[index].title ?? "");
                    },
                    child: ItemBookView(
                      imgPath: bookList[index].bookImage ?? imgUrl3,
                      description: bookList[index].title ?? "",
                      author: bookList[index].author ?? "",
                    ),
                  )),
        )
      ],
    );
  }
}
