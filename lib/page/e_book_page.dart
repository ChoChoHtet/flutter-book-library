import 'package:book_library/data/vos/overview_vo.dart';
import 'package:book_library/page/book_detail_page.dart';
import 'package:book_library/page/see_more_detail_page.dart';
import 'package:book_library/resource/dimen.dart';
import 'package:book_library/resource/string.dart';
import 'package:book_library/widgets/horizontal_book_view.dart';
import 'package:flutter/material.dart';

class EBookPage extends StatelessWidget {
  const EBookPage({
    Key? key,
    required this.overviewList,
  }) : super(key: key);
  final List<OverviewVO> overviewList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        paddingNormal,
        paddingNormal,
        paddingNormal,
        5,
      ),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: overviewList.length,
        itemBuilder: (context,index) {
          return HorizontalBookView(
              title: overviewList[index].name ?? "",
              bookList: overviewList[index].books ?? [],
              onTapBook: () => _navigateToBookDetailScreen(context),
              onTapSeeMore: () => _navigateToBookDetailScreen(context));
        },
      ),
    );
  }

  void _navigateToBookDetailScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BookDetailPage()),
    );
  }

  void _navigateTSeeMoreScreen(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SeeMoreDetailPage(
                title: title,
              )),
    );
  }
}
