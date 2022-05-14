import 'package:flutter/material.dart';

import '../data/vos/book_vo.dart';
import '../resource/dimen.dart';
import '../viewItems/item_grid_view.dart';
import '../viewItems/item_list_view.dart';
import 'normal_text.dart';

class SortAndListMenuView extends StatelessWidget {
  const SortAndListMenuView({
    Key? key,
    required this.sortByName,
    required this.listType,
    required this.bookList,
    required this.onTapSortBy,
    required this.onTapList,
    required this.onTapBook,
    required this.onTapMenu,
  }) : super(key: key);

  final String sortByName;
  final int listType;
  final List<BookVO> bookList;
  final VoidCallback onTapSortBy;
  final VoidCallback onTapList;
  final Function(String) onTapBook;
  final Function(String,String,String) onTapMenu;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SortByView(
            onTapSortBy: onTapSortBy,
            sortByName: sortByName,
            onTapList: onTapList),
        const SizedBox(height: 29),
        ListMenuSection(
          bookList: bookList,
          result: listType,
          onTapBook: (title) => onTapBook(title),
          onTapMenu: (title,imgPath,author) => onTapMenu(title,imgPath,author),
        )
      ],
    );
  }
}

class SortByView extends StatelessWidget {
  const SortByView({
    Key? key,
    required this.onTapSortBy,
    required this.sortByName,
    required this.onTapList,
  }) : super(key: key);

  final VoidCallback onTapSortBy;
  final String sortByName;
  final VoidCallback onTapList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTapSortBy,
          child: const Icon(
            Icons.sort,
            size: normalIconSize,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: NormalText(
            text: "Sort by: $sortByName",
            textSize: 16,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: paddingNormal),
          child: InkWell(
            onTap: onTapList,
            child: const Icon(
              Icons.list_alt,
              size: normalIconSize,
            ),
          ),
        )
      ],
    );
  }
}

class ListMenuSection extends StatelessWidget {
  const ListMenuSection({
    Key? key,
    required this.bookList,
    required int result,
    required this.onTapBook,
    required this.onTapMenu,
  })  : _result = result,
        super(key: key);

  final int _result;
  final List<BookVO> bookList;
  final Function(String) onTapBook;
  final Function(String,String,String) onTapMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _result == 1
          ? ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 30,
              ),
              itemCount: bookList.length,
              itemBuilder: (context, index) => ItemListView(
                imgPath: bookList[index].bookImage ?? "",
                title: bookList[index].title ?? "",
                author: bookList[index].author ?? "",
                onTapBook: (title) => onTapBook(title),
                onTapMenu: (title,imgPath,author) => onTapMenu(title,imgPath,author),
              ),
            )
          : GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: bookList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _result == 2 ? 2 : 3,
                  childAspectRatio: _result == 2 ? 0.8 : 0.5,
                  crossAxisSpacing: 10),
              itemBuilder: (context, index) => ItemGridView(
                imgPath: bookList[index].bookImage ?? "",
                title: bookList[index].title ?? "",
                author: bookList[index].author ?? "",
                onTapBook: (title) => onTapBook(title),
                onTapMenu: (title,imgPath,author) => onTapMenu(title,imgPath,author),
              ),
            ),
    );
  }
}
