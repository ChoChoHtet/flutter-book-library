import 'package:book_library/resource/dimen.dart';
import 'package:book_library/resource/string.dart';
import 'package:flutter/material.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({Key? key,
    required this.imgPath,
    required this.title,
    required this.author,
    required this.onTapBook,
    required this.onTapMenu,

  }) : super(key: key);
  final String imgPath;
  final String title;
  final String author;
  final Function(String) onTapBook;
  final Function(String,String,String) onTapMenu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: paddingNormal),
      child: InkWell(
        onTap: () => onTapBook(title),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imgPath.isNotEmpty ? imgPath : imgUrl3,
                width: 60,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
             SizedBox(
              width: 200,
              child: BookInfoSection(title: title,author: author,),
            ),
            const Spacer(),
            const Icon(
              Icons.download_done_sharp,
              size: normalIconSize,
            ),
            const SizedBox(
              width: 30,
            ),
            InkWell(
              onTap: () => onTapMenu(title,imgPath,author),
              child: const Icon(
                Icons.more_horiz_rounded,
                size: normalIconSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookInfoSection extends StatelessWidget {
  const BookInfoSection({
    Key? key,
    required this.title,
    required this.author
  }) : super(key: key);
  final String title;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children:  [
        Flexible(
            flex: 1,
            child: Text(
             title,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
           author,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
        ),
        const Text(
          "Ebook . Sample",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
