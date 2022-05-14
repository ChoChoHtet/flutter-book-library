import 'package:book_library/bloc/detail_see_more_bloc.dart';
import 'package:book_library/data/vos/book_vo.dart';
import 'package:book_library/resource/dimen.dart';
import 'package:book_library/viewItems/item_book_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../resource/string.dart';
import '../widgets/normal_text.dart';
import '../widgets/title_text.dart';
import 'add_shelf_page.dart';
import 'detail_book_page.dart';

class DetailSeeMorePage extends StatefulWidget {
  const DetailSeeMorePage(
      {Key? key, required this.title, required this.date, required this.offset})
      : super(key: key);
  final String title;
  final String date;
  final int offset;

  @override
  State<DetailSeeMorePage> createState() => _DetailSeeMorePageState();
}

class _DetailSeeMorePageState extends State<DetailSeeMorePage> {
  DetailSeeMoreBloc? seeMoreBloc;

  @override
  void initState() {
    super.initState();
    seeMoreBloc = DetailSeeMoreBloc(widget.title, widget.date, widget.offset);
  }

  @override
  void dispose() {
    super.dispose();
    seeMoreBloc?.clearDisposeNotify();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => seeMoreBloc,
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
              title: TitleText(title: widget.title),
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
                    author: bookList[index].author ?? "",
                    onTapBook: (title) => _navigateToBookDetailScreen(context, title),
                    onTapMenu: (title,imgPath)  => _showMenuList(context, title, imgPath)
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToBookDetailScreen(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailBookPage(
                title: title,
              )),
    );
  }
  void _onTapMenuItem(String action, {String bookTitle = ""}) {
    //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("onTap Menu")),);
    debugPrint("on Tap Menu: $action");
    if (action == menuAddToShelf) {
      _navigateTAddShelfScreen(context, bookTitle);
    }
  }
  void _navigateTAddShelfScreen(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddShelfPage(
            bookTitle: title,
          )),
    );
  }

  void _showMenuList(BuildContext context, String title, String imgPath) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: 70,
                        height: 100,
                        child: Image.network(
                          imgPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: paddingNormal,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style:
                              const TextStyle(fontSize: mediumTextSize),
                            ),
                            const NormalText(text: "Writer"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Wrap(
                children: [
                  ListTile(
                    leading: const Icon(Icons.remove_circle_outline),
                    title: const NormalText(
                      text: menuRemoveDownload,
                    ),
                    onTap: () => _onTapMenuItem(menuRemoveDownload),
                  ),
                  ListTile(
                    leading: const Icon(Icons.delete),
                    title: const NormalText(
                      text: menuDeleteLibrary,
                    ),
                    onTap: () => _onTapMenuItem(menuDeleteLibrary),
                  ),
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const NormalText(
                      text: menuAddToShelf,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _onTapMenuItem(menuAddToShelf, bookTitle: title);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.book),
                    title: const NormalText(
                      text: menuAddThisBook,
                    ),
                    onTap: () => _onTapMenuItem(menuAddThisBook),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Buy SGD 10"),
                ),
              )
            ],
          ),
        ));
  }
}
