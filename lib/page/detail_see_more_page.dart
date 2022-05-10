import 'package:book_library/bloc/detail_see_more_bloc.dart';
import 'package:book_library/data/vos/book_vo.dart';
import 'package:book_library/data/vos/overview_vo.dart';
import 'package:book_library/resource/dimen.dart';
import 'package:book_library/viewItems/item_book_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewItems/item_grid_view.dart';
import '../widgets/title_text.dart';

class DetailSeeMorePage extends StatelessWidget {
  const DetailSeeMorePage(
      {Key? key, required this.title, required this.date, required this.offset})
      : super(key: key);
  final String title;
  final String date;
  final int offset;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailSeeMoreBloc(title, date, offset),
      child: Scaffold(
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
              child: Selector<DetailSeeMoreBloc, List<BookVO>>(
                selector: (context, bloc) => bloc.bookList,
                builder: (context, bookList, child) => GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: bookList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) => ItemBookView(
                      imgPath: bookList[index].bookImage ?? "",
                      description: bookList[index].title ?? "",
                      author: bookList[index].author ?? ""),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
