import 'package:book_library/resource/dimen.dart';
import 'package:book_library/resource/string.dart';
import 'package:book_library/widgets/horizontal_book_view.dart';
import 'package:flutter/cupertino.dart';


class EBookPage extends StatelessWidget {
  const EBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(paddingNormal, paddingNormal, paddingNormal,5),
      child:  ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: const [
          HorizontalBookView(
            title: revision,
            imgPath: imgUrl,
            description: "",
            author: "author",
          ),
          SizedBox(height: 30,),
          HorizontalBookView(
            title: ebookTitle,
            imgPath: imgUrl,
            description: "",
            author: "author",
          ),
          SizedBox(height: 30,),
          HorizontalBookView(
            title: onYourWishlist,
            imgPath: imgUrl,
            description: "",
            author: "author",
          ),
        ],
      ),
    );
  }
}
