import 'package:book_library/data/vos/overview_vo.dart';
import 'package:book_library/page/detail_book_page.dart';
import 'package:book_library/page/detail_see_more_page.dart';
import 'package:book_library/resource/dimen.dart';
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
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 20,),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: overviewList.length,
        itemBuilder: (context,index) {
          return HorizontalBookView(
              title: overviewList[index].name ?? "",
              bookList: overviewList[index].books ?? [],
              onTapBook: (title) => _navigateToBookDetailScreen(context,title),
              onTapSeeMore: () => _navigateTSeeMoreScreen(
                  context, overviewList[index].name ?? "",
                  overviewList[index].bestSellerDate ?? "",
                0
              ));
        },
      ),
    );
  }

  void _navigateToBookDetailScreen(BuildContext context,String title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  DetailBookPage(title: title,)),
    );
  }

  void _navigateTSeeMoreScreen(
      BuildContext context, String title, String date, int offset) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailSeeMorePage(
            title: title,
            date: date,
            offset: offset,
          )),
    );
  }
}
