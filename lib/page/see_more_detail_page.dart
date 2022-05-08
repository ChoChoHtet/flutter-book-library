import 'package:book_library/resource/dimen.dart';
import 'package:book_library/resource/string.dart';
import 'package:book_library/viewItems/item_book_view.dart';
import 'package:flutter/material.dart';

import '../viewItems/item_grid_view.dart';
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
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Container(
            padding: const EdgeInsets.only(left: paddingNormal),
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 12,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:0.8,
                    crossAxisSpacing: 10
                ),
                itemBuilder: (context, index) => const ItemGridView(),),
          ),
        ),
        ),
    );
  }
}
