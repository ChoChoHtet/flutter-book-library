import 'package:book_library/resource/dimen.dart';
import 'package:book_library/widgets/normal_text.dart';
import 'package:flutter/cupertino.dart';

import '../resource/string.dart';

class ItemSearchView extends StatelessWidget {
  final String coverUrl;
  final String title;
  final String author;

  const ItemSearchView({
    Key? key,
    required this.title,
    required this.coverUrl,
    required this.author,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            coverUrl.isEmpty ? imgUrl3 : coverUrl,
            width: 60,
            height: 90,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NormalText(
                text: title,
                textSize: normalTextSize,
              ),
              const SizedBox(
                height: 10,
              ),
              NormalText(
                text: author,
                textSize: smallTextSize,
              )
            ],
          ),
        )
      ],
    );
  }
}
