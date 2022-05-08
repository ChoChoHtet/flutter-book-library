import 'package:book_library/page/book_detail_page.dart';
import 'package:book_library/page/see_more_detail_page.dart';
import 'package:book_library/resource/dimen.dart';
import 'package:book_library/resource/string.dart';
import 'package:book_library/widgets/horizontal_book_view.dart';
import 'package:flutter/material.dart';

class EBookPage extends StatelessWidget {
  const EBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
          paddingNormal, paddingNormal, paddingNormal, 5),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          HorizontalBookView(
            title: revision,
            imgPath: imgUrl,
            description: "",
            author: "author",
            onTapSeeMore: ()=> _navigateTSeeMoreScreen(context,revision),
            onTapBook: () => _navigateToBookDetailScreen(context),
          ),
          const SizedBox(
            height: 30,
          ),
          HorizontalBookView(
            title: ebookTitle,
            imgPath: imgUrl,
            description: "",
            author: "author",
            onTapSeeMore: ()=> _navigateTSeeMoreScreen(context,ebookTitle),
            onTapBook: () {},
          ),
          const SizedBox(
            height: 30,
          ),
          HorizontalBookView(
            title: onYourWishlist,
            imgPath: imgUrl,
            description: "",
            author: "author",
            onTapSeeMore: ()=> _navigateTSeeMoreScreen(context,onYourWishlist),
            onTapBook: () {},
          ),
        ],
      ),
    );
  }

  void _navigateToBookDetailScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BookDetailPage()),
    );
  }
  void _navigateTSeeMoreScreen(BuildContext context,String title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  SeeMoreDetailPage(title: title,)),
    );
  }
}
