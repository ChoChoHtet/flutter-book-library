import 'package:book_library/resource/dimen.dart';
import 'package:book_library/resource/string.dart';
import 'package:book_library/viewItems/item_book_view.dart';
import 'package:flutter/material.dart';

import '../widgets/title_text.dart';

class SeeMoreDetailPage extends StatelessWidget {
  const SeeMoreDetailPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: normalIconSize,
                  color: Colors.black54,
                )),
            title: TitleText(title: title),
          )
        ],
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: paddingNormal),
          child: GridView.builder(
            itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                mainAxisSpacing: 8
              ),
              itemBuilder: (context, index) => const ItemBookView(
                    imgPath: imgUrl3,
                    description: "Learn UX for designer example books",
                    author: "Jeff Gothelf",
                  )),
        ),
      ),
    );
  }
}
