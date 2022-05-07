import 'package:book_library/resource/dimen.dart';
import 'package:book_library/resource/string.dart';
import 'package:flutter/material.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(imgUrl3,width: 60,height: 100,fit: BoxFit.cover,),
        ),
        const SizedBox(
          width: 20,
        ),
        const SizedBox(
          width: 200,
          child: BookInfoSection(),
        ),
        const Spacer(),
        const Icon(
          Icons.download_done_sharp,size: normalIconSize,),
        const SizedBox(width: 30,),
        const Icon(
          Icons.more_horiz_rounded,size: normalIconSize,),
      ],
    );
  }
}

class BookInfoSection extends StatelessWidget {
  const BookInfoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children:  const [
        Flexible(
          flex: 1,
            child: Text(
              "Never send a human to do a machine job",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),
            )
        ),
        Padding(
          padding: EdgeInsets.only(top: 6),
          child: Text(
            "Yong Zhao, Gaoming Zhang,Yong Zhao, Gaoming Zhang,Yong Zhao, Gaoming Zhang",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
        ),
        Text(
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
