import 'package:book_library/bloc/search_bloc.dart';
import 'package:book_library/data/vos/book_vo.dart';
import 'package:book_library/resource/dimen.dart';
import 'package:book_library/utils/debouncer.dart';
import 'package:book_library/viewItems/item_search_view.dart';
import 'package:book_library/widgets/horizontal_book_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resource/string.dart';
import '../widgets/normal_text.dart';
import 'add_shelf_page.dart';
import 'detail_book_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<BookVO> searchResultsList = List.empty();
  String searchQuery = "";
  SearchBloc? searchBloc;
  final debouncer = Debouncer(milliseconds: 700);

  @override
  void initState() {
    super.initState();
    searchBloc = SearchBloc();
  }

  @override
  void dispose() {
    super.dispose();
    searchBloc?.clearDisposeNotify();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => searchBloc,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          toolbarHeight: 70,
          iconTheme: const IconThemeData(color: Colors.grey),
          titleSpacing: 0,
          title: Builder(builder: (context) {
            return BookSearchView(
              onTextSubmitted: (query) {
                if (query.isNotEmpty) {
                  var searchBloc =
                      Provider.of<SearchBloc>(context, listen: false);
                  searchBloc.getSearchResultGroup(query);
                }
              },
              onTextChanged: (query) {
               debouncer.run((){
                 debugPrint("On Change was called: $query");
                 if (query.isNotEmpty) {
                   var searchBloc =
                   Provider.of<SearchBloc>(context, listen: false);
                   searchBloc.getSearchSuggestion(query);
                 }
                 setState(() {
                   searchQuery = query;
                 });
               });
              },
            );
          }),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingNormal),
          child: ListView(
            children: [
              Visibility(
                visible: searchQuery.isNotEmpty,
                child: Consumer<SearchBloc>(
                  builder: (context, bloc, child) => ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                            height: paddingNormal,
                          ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: bloc.shouldShowResult
                          ? bloc.searchResultList.keys.toList().length
                          : bloc.suggestionList.length,
                      itemBuilder: (context, index) {
                        return bloc.shouldShowResult
                            ? HorizontalBookView(
                                title: bloc.searchResultList.keys
                                        .toList()[index] ??
                                    "",
                                bookList: bloc.searchResultList.values
                                    .toList()[index],
                                onTapBook: (title) =>
                                    _navigateToBookDetailScreen(context, title),
                                onTapSeeMore: () =>
                                    debugPrint("On Tap See more"),
                                onTapMenu: (title,imgPath) => _showMenuList(context, title, imgPath),
                              )
                            : ItemSearchView(
                                coverUrl:
                                    bloc.suggestionList[index].bookImage ?? "",
                                title: bloc.suggestionList[index].title ?? "",
                                author: bloc.suggestionList[index].author ?? "",
                                onTapSuggestion: () {
                                  debugPrint("on Tap Search Item");
                                  _navigateToBookDetailScreen(context,
                                      bloc.suggestionList[index].title ?? "");
                                },
                              );
                      }),
                ),
              ),
              Visibility(
                visible: searchQuery.isEmpty,
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(
                        Icons.show_chart,
                        color: Colors.blue,
                      ),
                      title: Text("Top Selling"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.new_releases_outlined,
                        color: Colors.blue,
                      ),
                      title: Text(
                        "New releases",
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.store_outlined,
                        color: Colors.blue,
                      ),
                      title: Text("Bookshop"),
                    )
                  ],
                ),
              )
            ],
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

  void _navigateTAddShelfScreen(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddShelfPage(
                bookTitle: title,
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
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              NormalText(text: "The making of a manager"),
                              NormalText(text: "Writer"),
                            ],
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

class BookSearchView extends StatelessWidget {
  const BookSearchView({
    Key? key,
    required this.onTextChanged,
    required this.onTextSubmitted,
  }) : super(key: key);
  final Function(String) onTextChanged;
  final Function(String) onTextSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: normalIconSize,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.76,
                child: TextField(
                  textInputAction: TextInputAction.search,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Play Books",
                  ),
                  onSubmitted: (value) {
                    debugPrint("On Submitted was called: $value");
                    onTextSubmitted(value);
                  },
                  onChanged: (value) {
                    onTextChanged(value);
                  },
                ),
              ),
              const Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.mic,
                  size: normalIconSize,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
        )
      ],
    );
  }
}
